# WhatShouldIMakeForDinner
A web application for making meal planning easier

Git clone the repository

Create a virtual environment
    $ python -m venv [ENV_NAME]
To activate virtual environment in VSCode:
    $ Set-ExecutionPolicy Unrestricted -Scope Process
    $ ./[venvName]/Scripts/activate
https://stackoverflow.com/questions/68855845/how-to-use-the-python-debugger-in-venv-in-vscode-on-windows


Use the requirements.txt to install dependencies
$ pip install -r requirements.txt



To create an Admin user:

$ python manage.py createsuperuser

Enter desired username

Enter desired email address

The final step is to enter your password. You will be asked to enter your password twice, the second time as a confirmation of the first.


To start the development server: 

$ python manage.py runserver

Open a browser window and go to '/admin/' on your local domain




