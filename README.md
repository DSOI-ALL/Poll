docker image for django (uwsgi) & nginx
based off of stackbrew/ubuntu:12.04

To pull this image:

Example usage:
`docker run -p 80:80 -d -e MODULE=myapp django-uwsgi-nginx`

You can mount the application volume to run a specific application.  The default volume inside in the container is `/opt/django/app`.
`docker run -p 80:80 -d -e MODULE=gangplank -v /vagrant/web-interface/webapp:/opt/django/app mbentley/ubuntu-django-uwsgi-nginx`

If there is not an app, it will create a default django project.
# Poll
