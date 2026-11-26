from app import create_app, db


def make_client():
    app = create_app()
    app.config['TESTING'] = True
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'
    client = app.test_client()
    ctx = app.app_context()
    ctx.push()
    db.create_all()
    return client, ctx


def register(client, username, email, password='password123'):
    res = client.post('/api/auth/register', json={
        'username': username, 'email': email, 'password': password})
    assert res.status_code == 201, res.get_json()
    return res.get_json()


def teardown(ctx):
    db.session.remove()
    db.drop_all()
    ctx.pop()


def test_frontend_index():
    client, ctx = make_client()
    try:
        res = client.get('/')
        assert res.status_code == 200
        assert 'Splitwise Clone' in res.get_data(as_text=True)
    finally:
        teardown(ctx)


def test_balance_and_settle_flow():
    client, ctx = make_client()
    try:
        alice = register(client, 'alice', 'alice@example.com')
        bob = register(client, 'bob', 'bob@example.com')

        res = client.post('/api/groups/create', json={
            'name': 'Trip', 'members': [alice['id'], bob['id']]})
        assert res.status_code == 201, res.get_json()
        group_id = res.get_json()['id']

        res = client.post('/api/expenses/create', json={
            'description': 'Dinner', 'amount': 100.0,
            'user_id': alice['id'], 'group_id': group_id,
            'splits': [{'user_id': bob['id'], 'amount': 50.0}]})
        assert res.status_code == 201, res.get_json()

        res = client.get(f"/api/expenses/balance/{alice['id']}?group_id={group_id}")
        assert res.status_code == 200, res.get_json()
        assert res.get_json()['net_balance'] == 100.0

        res = client.get(f'/api/expenses/group/{group_id}/balances')
        assert res.status_code == 200, res.get_json()
        assert len(res.get_json()) == 2

        res = client.post('/api/expenses/settle', json={
            'from_user_id': bob['id'], 'to_user_id': alice['id'],
            'amount': 50.0, 'group_id': group_id})
        assert res.status_code == 201, res.get_json()

        res = client.post('/api/expenses/settle', json={
            'from_user_id': bob['id'], 'to_user_id': bob['id'], 'amount': 10.0})
        assert res.status_code == 400
    finally:
        teardown(ctx)
