#!/bin/bash

MODULE=${MODULE:-website}

sed -i "s#module=website.wsgi:application#module=${MODULE}.wsgi:application#g" /opt/django/uwsgi.ini

if [ ! -f "/opt/django/app/manage.py" ]
then
	echo "creating basic django project (module: ${MODULE})"
	django-admin.py startproject ${MODULE} /opt/django/app/
fi

## start services, Syncdb, install fixtures, collect static
echo "Running collectstatic..."
#/usr/bin/python /opt/django/app/manage.py collectstatic --noinput
#echo "Synchronizing application database"
#/usr/bin/python /opt/django/app/manage.py syncdb --noinput
#echo "Loading bootstrap data..."
#/usr/bin/python /opt/django/app/manage.py loaddata /opt/django/app/gangplank/fixtures/initial_data.json

# start supervisor
echo "Starting supervisor"
/usr/bin/python /opt/django/app/manage.py runserver 0.0.0.0:80
echo "Started."
