from django.db import models

# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=10)
    password = models.CharField(max_length=20)
    
class Message(models.Model):
    sender = models.ForeignKey("User",on_delete=models.CASCADE)
    content = models.TextField()