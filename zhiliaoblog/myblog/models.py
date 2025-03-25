from django.db import models
from django.contrib.auth import get_user_model

User = get_user_model()

# Create your models here.
class BlogCategory(models.Model):
    name = models.CharField(max_length=200,verbose_name='博客分类')

    def __self__(self):
        return self.name

    # 后台如果要显示中文
    class Meta:
        verbose_name = "博客分类"
        verbose_name_plural = verbose_name


class Blog(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    pub_time =models.DateTimeField(auto_now_add=True)
    category = models.ForeignKey(BlogCategory, on_delete=models.CASCADE)
    author = models.ForeignKey(User,on_delete=models.CASCADE)

    class Meta:
        ordering = ["-pub_time"]

class BlogComment(models.Model):
    content = models.TextField()
    pub_time = models.DateTimeField(auto_now_add=True)
    blog = models.ForeignKey(Blog,on_delete=models.CASCADE,related_name="comments",verbose_name='所属博客')
    author = models.ForeignKey(User,on_delete=models.CASCADE)

    class Meta:
        ordering = ["-pub_time"]
