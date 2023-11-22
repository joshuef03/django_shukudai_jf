from django.db import models
from cloudinary.models import CloudinaryField
import datetime
class Post(models.Model):
    title=models.CharField(max_length=100)
    description = models.TextField()
    image = CloudinaryField('image')
    date =models.DateField(datetime.date.today)