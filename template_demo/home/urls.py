from django.urls import path
from . import views

app_name = "home"

urlpatterns = [
    path('', views.index,name="index"),
    path('detail', views.book_detail,name="book_detail"),
    path('baidu', views.baidu,name="baidu"),
    path('<int:book_id>', views.book_detail_path, name="book_detail_path"),
]