let currentUserId = null;
let currentGroupId = null;

async function api(path, options) {
  const res = await fetch(path, {
    headers: {'Content-Type': 'application/json'},
    ...options,
  });
  const body = await res.json().catch(() => ({}));
  if (!res.ok) throw new Error(body.error || JSON.stringify(body) || res.statusText);
  return body;
}

function showSections() {
  for (const id of ['groups', 'expenses', 'balances']) {
    document.getElementById(id).hidden = currentUserId === null;
  }
}

async function register() {
  const user = await api('/api/auth/register', {method: 'POST', body: JSON.stringify({
    username: document.getElementById('username').value,
    email: document.getElementById('email').value,
    password: document.getElementById('password').value,
  })});
  setUser(user);
}

async function login() {
  const user = await api('/api/auth/login', {method: 'POST', body: JSON.stringify({
    username: document.getElementById('username').value,
    password: document.getElementById('password').value,
  })});
  setUser(user);
  await refreshGroups();
  await refreshExpenses();
}

function setUser(user) {
  currentUserId = user.id;
  document.getElementById('userInfo').textContent = `Signed in as ${user.username} (id ${user.id})`;
  showSections();
}

async function refreshGroups() {
  const groups = await api(`/api/groups/user/${currentUserId}`);
  const list = document.getElementById('groupList');
  list.innerHTML = '';
  for (const g of groups) {
    if (currentGroupId === null) currentGroupId = g.id;
    const li = document.createElement('li');
    li.textContent = `${g.name} (id ${g.id})`;
    list.appendChild(li);
  }
}

async function createGroup() {
  const members = document.getElementById('memberIds').value.split(',')
    .map(s => parseInt(s.trim(), 10)).filter(n => !isNaN(n));
  if (!members.includes(currentUserId)) members.push(currentUserId);
  const group = await api('/api/groups/create', {method: 'POST', body: JSON.stringify({
    name: document.getElementById('groupName').value,
    members,
  })});
  currentGroupId = group.id;
  await refreshGroups();
}

function parseSplits(text) {
  if (!text.trim()) return undefined;
  return text.split(',').map(part => {
    const [userId, amount] = part.split(':').map(s => s.trim());
    return {user_id: parseInt(userId, 10), amount: parseFloat(amount)};
  });
}

async function refreshExpenses() {
  const expenses = await api(`/api/expenses/user/${currentUserId}`);
  const list = document.getElementById('expenseList');
  list.innerHTML = '';
  for (const e of expenses) {
    const li = document.createElement('li');
    li.textContent = `${e.description}: ${e.amount}`;
    list.appendChild(li);
  }
}

async function createExpense() {
  await api('/api/expenses/create', {method: 'POST', body: JSON.stringify({
    description: document.getElementById('expDesc').value,
    amount: parseFloat(document.getElementById('expAmount').value),
    user_id: currentUserId,
    group_id: currentGroupId,
    splits: parseSplits(document.getElementById('expSplits').value),
  })});
  await refreshExpenses();
}

async function refreshBalance() {
  const b = await api(`/api/expenses/balance/${currentUserId}${currentGroupId ? `?group_id=${currentGroupId}` : ''}`);
  document.getElementById('balanceInfo').textContent =
    `Paid ${b.total_paid}, owed ${b.total_owed}, net ${b.net_balance}`;
}

async function settle() {
  const result = await api('/api/expenses/settle', {method: 'POST', body: JSON.stringify({
    from_user_id: currentUserId,
    to_user_id: parseInt(document.getElementById('settleTo').value, 10),
    amount: parseFloat(document.getElementById('settleAmount').value),
    group_id: currentGroupId,
  })});
  document.getElementById('settleInfo').textContent =
    `Settled ${result.amount} to user ${result.to_user_id}`;
}

document.getElementById('registerBtn').addEventListener('click', () => register().catch(e => alert(e.message)));
document.getElementById('loginBtn').addEventListener('click', () => login().catch(e => alert(e.message)));
document.getElementById('createGroupBtn').addEventListener('click', () => createGroup().catch(e => alert(e.message)));
document.getElementById('createExpenseBtn').addEventListener('click', () => createExpense().catch(e => alert(e.message)));
document.getElementById('balanceBtn').addEventListener('click', () => refreshBalance().catch(e => alert(e.message)));
document.getElementById('settleBtn').addEventListener('click', () => settle().catch(e => alert(e.message)));
showSections();
