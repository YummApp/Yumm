# Yumm
## Command prompts for backend:
  ### Before working with django create and activate virtual environment. Must activate everytime you are working on backend.
  $ python3 -m venv env
  $ source env/bin/activate

  ### To deactivate virtual environment
  $ deactivate
  
  ### Install dependencies after activating virtual environment
  $ python -m pip install -r requirements.txt

  ### If you install any packages or dependencies, update requirements.txt
  $ python -m pip freeze > requirements.txt

  ### Creating apps (replace <app name> with desired name)
  $ python manage.py startapp <app name>
