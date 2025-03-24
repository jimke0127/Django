from django.urls import path
from . import views

app_name = "front"

urlpatterns = [
    path('avg', views.avg_view,name="avg_view"),
    path('f_q_view', views.f_q_view,name="f_q_view"),
]