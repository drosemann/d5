# Modern Blog Website

## Features
- Admin authentication
- Create, Edit, Delete blog posts
- Responsive modern UI

## Setup
1. Create a virtual environment
```bash
python -m venv venv
source venv/bin/activate  # On Windows use `venv\Scripts\activate`
```

2. Install dependencies
```bash
pip install -r requirements.txt
```

3. Set up environment variables
Create a `.env` file with:
```
SECRET_KEY=your_secret_key
DATABASE_URL=sqlite:///blog.db
```

4. Initialize the database
```bash
flask db upgrade
```

5. Run the application
```bash
flask run
```
