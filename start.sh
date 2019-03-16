#!/bin/bash

askbot-setup --dir-name=. \
    --db-engine=${ASKBOT_DATABASE_ENGINE:-2} \
    --db-host=${ASKBOT_DATABASE_HOST} \
    --db-port=${ASKBOT_DATABASE_PORT} \
    --db-name=${ASKBOT_DATABASE_NAME} \
    --db-user=${ASKBOT_DATABASE_USER} \
    --db-password=${ASKBOT_DATABASE_PASSWORD}

sed "s/ROOT_URLCONF.*/ROOT_URLCONF = 'urls'/"  settings.py -i

python manage.py migrate --noinput
python manage.py collectstatic --noinput


python manage.py runserver 0.0.0.0:8082
