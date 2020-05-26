INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'incidents.apps.IncidentsConfig',
    'user.apps.UserConfig',
]

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mydb',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}

LANGUAGE_CODE = 'pl-pl'

TIME_ZONE = 'Europe/Warsaw'

STATIC_URL = '/static/'
AUTH_USER_MODEL = 'user.Uzytkownik'
