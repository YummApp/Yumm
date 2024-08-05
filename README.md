# Yumm
## Command prompts for backend:
  ### Before working with django create and activate virtual environment. Must activate everytime you are working on backend.
  $ python3 -m venv env <br />
  If fails, try: python -m venv env <br />
  $ source env/bin/activate <br />
  For Windows: $ env\Scripts\activate
  ### To deactivate virtual environment
  $ deactivate
  
  ### Install dependencies after activating virtual environment
  $ python -m pip install -r requirements.txt

  ### If you install any packages or dependencies, update requirements.txt
  $ python -m pip freeze > requirements.txt

  ### Creating apps (replace (app name) with desired name)
  $ python manage.py startapp (app name)

  ### Install Homebrew (Mac) and install psql (PostgreSQL tool)
  $ brew install psql

  ### Use psql to connect to database (you will be prompted for password after)
  $ psql -h database-1.c9ummsu6kjvh.us-east-2.rds.amazonaws.com -U yummappdev -d yummdb
