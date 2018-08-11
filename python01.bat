mkdir djangogirls
cd djangogirls
python -m venv myvenv
myvenv\Scripts\activate
pip install django==1.8.5
python -m pip install --upgrade pip
python myvenv\Scripts\django-admin.py startproject mysite .

TIME_ZONE = 'America/Sao_Paulo'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')

python manage.py migrate
python manage.py runserver
http://127.0.0.1:8000/

python manage.py startapp blog

INSTALLED_APPS = (
'django.contrib.admin',
'django.contrib.auth',
'django.contrib.contenttypes',
'django.contrib.sessions',
'django.contrib.messages',
'django.contrib.staticfiles',
'blog',
)


from django.db import models
from django.utils import timezone

class Post(models.Model):
	author = models.ForeignKey('auth.User')
	title = models.CharField(max_length=200)
	text = models.TextField()

	created_date = models.DateTimeField(
		default=timezone.now)

	published_date = models.DateTimeField(
	blank=True, null=True)

	def publish(self):
		self.published_date = timezone.now()
		self.save()

	def __str__(self):
		return self.title

python manage.py makemigrations blog
python manage.py migrate blog
python manage.py runserver
http://127.0.0.1:8000/admin/
python manage.py createsuperuser


$ git init
$ git config user.name "ajanu"
$ git config user.email ajanuario@gmail.com
