# En miapp/views.py
import subprocess
from django.http import HttpResponse

def ejecutar_comandos(request):
    # Ejecuta los comandos
    subprocess.call("chmod -R 755 media/", shell=True)
    subprocess.call("touch /etc/nginx/conf.d/media.conf", shell=True)
    subprocess.call("echo 'location /public/ { alias /media/; }' > /etc/nginx/conf.d/media.conf", shell=True)
    subprocess.call("service nginx restart", shell=True)
    
    # Devuelve una respuesta
    return HttpResponse("Comandos ejecutados con éxito")
