from django.shortcuts import render
from rest_framework.viewsets import ModelViewSet
from rest_framework import serializers
from . import models

# Create your views here.

class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.User
        fields = ["id","name","password"]
        
class RegisterView(ModelViewSet):
    queryset = models.User.objects
    serializer_class = RegisterSerializer
    
