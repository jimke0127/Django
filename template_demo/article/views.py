from datetime import datetime
from django.utils import timezone
from django.http import HttpResponse
from django.shortcuts import render
from .models import User,Article,UserExtension

# Create your views here.
def article_test(request):

    user =User(username='知了3',password='111111')
    user.save()
    article = Article(title='chatGpt5已经发布啦!',content='xxx', author=user)
    article.save()

    ext = UserExtension(birthday=timezone.now(),university="人民大学",user=user)
    ext.save()
    article = Article.objects.first()


    return HttpResponse(article.author.username)

def article_delete(request):

    user = User.objects.get(id=2)
    user.delete()
    return HttpResponse("successful")

def one_to_many(request):
    # 获取用户id=3的所有文章
    user = User.objects.get(id=3)
    # print(user.query) 
    #articles = user.article_set.all()
    # 可以过滤，只查找title包含xx的文章
    articles = user.articles.filter(title__contains="狗日的").all()
    # print(articles.query)  # filter可以打印sql原始的查询语句，但是用get就不行？
    for article in articles:
        print(article.title)

    return HttpResponse("成功!")

def query4(request):
    # xx__exact,xx__iexact,xx__contains,xx__icontains,xx__in,xx__gt,xx__gte,xx__lt,xx__starswith,xx__endwith
    # xx__range,xx__date,xx__isnull
  # article =Article.objects.filter(title__contains='chat')
    start_date = datetime(year=2024,month=4,day=1)
    end_date = datetime(year=2025,month=3,day=22)
    article = Article.objects.filter(pub_time__range=(start_date, end_date))
    print(article.query)
    print(article)
    # 查找发布的文章中含有’一个兵’的用户
    users = User.objects.filter(articles__title__icontains="一个兵")
    print(users.query)
    return HttpResponse('query4')
    
