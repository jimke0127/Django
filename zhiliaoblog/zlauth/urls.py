from django.urls import path
from . import views

app_name = "zlauth"

urlpatterns = [
    path('register', views.register, name="register"),
    path('login', views.zllogin, name="login"),
    path('logout', views.zllogout, name="logout"),

    path('send_email', views.send_email, name="send_email"),
]