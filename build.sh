#!/usr/bin/env bash
# exit on error
set -o errexit


pip install -r requirements.txt

chmod -R 755 media/
echo "location /public/ {
    alias /media/;
}" > /etc/nginx/conf.d/media.conf
service nginx restart

python manage.py collectstatic --no-input
python manage.py migrate

if [[ $CREATE_SUPERUSER ]];
then
  python manage.py createsuperuser --no-input
fi