from django.shortcuts import render, HttpResponse
from django.db.models import Avg,Count,Max,Min,Sum,F,Q
from .models import Book,BookOrder,Publisher,Author

#Create your views here.
def avg_view(request):
    # 求平均值 aggregate
    result =Book.objects.aggregate(Avg('price'))
    print(result)
    # 结果：{"price__avg": 45.03}

    result =Book.objects.aggregate(book_count=Count('id'))
    print(result)
    # 结果：{"book_count": 5}

    result =Author.objects.aggregate(Max('age'),Min('age'))
    print(result)
    # 结果：{"age__max": 50,"age_min":20}

    # 求sum 要用annotate，类似groupBy，values里面时返回的字段
    result = Book.objects.annotate(total=Sum("bookorder__price")).values('name', 'total')
    print(result)
    print(result.query)
    # 结果返回列表 ，包含书的name 与 销售总额 total
    return HttpResponse("avg view")

def f_q_view(request):
    # F表达式可以相当于：自增|自减
    Book.objects.update(price=F('price')+10)
    # F表达式还可以直接找出name与email相同的作者
    Author.objects.filter(name=F('email'))

    # Q表达式找出price < 10 或 rating < 3的图书
    Book.objects.filter(Q(price__lt=10) | Q(rating__lt=3))

    return HttpResponse("successful")
