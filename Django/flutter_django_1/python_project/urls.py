from django.urls import path
from . import views

urlpatterns = [
    path('', views.myapp), # Empty for simple path
]