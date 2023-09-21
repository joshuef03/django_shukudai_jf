#!/usr/bin/env bash
# exit on error
set -o errexit


pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

chmod -R 755 media/
touch /etc/nginx/conf.d/media.conf

echo "location /public/ {
    alias /media/;
}" > /etc/nginx/conf.d/media.conf
service nginx restart

if [[ $CREATE_SUPERUSER ]];
then
  python manage.py createsuperuser --no-input
fi