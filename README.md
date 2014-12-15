**Step 1**: Requirements:

- Python 2.7 or 3.3+ on any supported OS (even Windows!)
- virtualenv (or pyvenv if you are using Python 3.4)
- git
- Network connection (only to install the application)

**Step 2**: Create a virtual environment.

For Linux, OSX or any other platform that uses *bash* as command prompt (including Cygwin on Windows):

    $ virtualenv venv
    $ source venv/bin/activate
    (venv) $ pip install -r requirements.txt

For Windows users working on the standard command prompt:

    > virtualenv venv
    > venv\scripts\activate
    (venv) > pip install -r requirements.txt

**Step 3**: Create an administrator user

    (venv) $ python manage.py adduser --admin <your-email-address> <your-username>
    Password: <pick-a-password>
    Confirm: <pick-a-password>
    User <your-username> was registered successfully.

**Step 4**: Configure a gmail account for the application to send emails from.

For Linux, OSX or any other platform that uses *bash* as command prompt:

    (venv) $ export MAIL_USERNAME=<your-gmail-username>
    (venv) $ export MAIL_PASSWORD=<your-gmail-password>

For Windows users working on the standard command prompt:

    (venv) > set MAIL_USERNAME=<your-gmail-username>
    (venv) > set MAIL_PASSWORD=<your-gmail-password>

**Step 5**: Start the application:

    (venv) $ python manage.py runserver
     * Running on http://127.0.0.1:5000/
     * Restarting with reloader

Now open your web browser and type [http://localhost:5000](http://localhost:5000) in the address bar to see the application running. If you feel adventurous click on the "Presenter Login" link on the far right of the navigation bar and ensure the account credentials you picked above work.