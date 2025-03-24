from django.db import models
from django.core import validators

# Create your models here.
class Article(models.Model):
    title = models.CharField(max_length=120,validators=[validators.MinLengthValidator(limit_value=2)]) 
    content = models.TextField(validators=[validators.MinLengthValidator(limit_value=2)])
    create_time = models.DateTimeField(auto_now_add=True)
    # blank=True 允许为空，不代表数据库允许为空，表单不填的会传一个空的字符串
    category = models.CharField(max_length=20,blank=True)