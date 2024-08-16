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
    
class ChatSerializer(serializers.ModelSerializer):
    sender = serializers.CharField(read_only=True,source = "User.name",required=False)
    receiver = serializers.CharField(read_only=True,source = "User.name",required=False)
    class Meta:
        model = models.Message
        fields = ["id","sender","receiver","content"]
        
class ChatView(ModelViewSet):
    queryset = models.Message.objects
    serializer_class = ChatSerializer