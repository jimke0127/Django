from django.db import models

# Create your models here.
class Book(models.Model):
    name = models.CharField(max_length=100)
    author = models.CharField(max_length=100)
    pub_time = models.DateTimeField(auto_now_add=True)
    price = models.FloatField(default=0)
    company = models.CharField(max_length=100,default='aaa')

    class Meta:
        db_table = "books"  #表名
        ordering = ['id']   #默认排序
