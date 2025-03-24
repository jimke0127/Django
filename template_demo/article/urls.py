from django.urls import path
from . import views

app_name = "article"

urlpatterns = [
    path('test', views.article_test,name="article_test"),
    path('delete', views.article_delete,name="article_delete"),
    path('onetomany', views.one_to_many,name="one_to_many"),
    path('query', views.query4,name="query"),
]