from django.urls import path
from . import views

app_name = "cookie_learn"

urlpatterns = [
    path('add', views.add_cookie,name="add_cookie"),
    path('delete', views.del_cookie,name="del_cookie"),
    path('get', views.get_cookie,name="get_cookie"),
    path('addsession', views.add_session,name="add_session"),
]