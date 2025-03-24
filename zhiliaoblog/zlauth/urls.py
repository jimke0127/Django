from django.urls import path
from . import views

app_name = "zlauth"

urlpatterns = [
    path('login', views.zllogin, name="login"),
    path('register', views.register, name="register"),
    path('send_email', views.send_email, name="send_email"),
]