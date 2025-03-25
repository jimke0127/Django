from django.urls import path
from . import views

app_name = "myblog"

urlpatterns = [
    path('', views.index, name="index"),
    path('<int:blog_id>', views.detail, name="detail"),
    path('pub', views.pub_blog, name="pub_blog"),
    path('pub_comment', views.pub_comment, name="pub_comment"),
]