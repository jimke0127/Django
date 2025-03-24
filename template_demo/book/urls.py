from django.urls import path
from . import views

app_name = "book"

urlpatterns = [
    path('add', views.add_book,name="add_book"),
    path('list', views.query_book,name="query_book"),
    path('update', views.update_book,name="update_book"),
]