from django.http import HttpResponse
from django.shortcuts import render
from .models import Book

# Create your views here.
def add_book(request):
    book = Book(name="西游记",author="罗贯中",price=100)
    book.save()
    return HttpResponse("Successful")

def query_book(request):
    #books = Book.objects.all()   #全部，返回列表
    books = Book.objects.filter(name="三国").order_by("-pub_time") #过滤条件，也有1条或多条，返回列表
    #books = Book.objects.get(name="三国") #过滤条件，只有1条，返回字典，找不到会报错，需要用try
    try:
        book = Book.objects.get(name="西游记2")
        print(book.author)
    except Book.DoesNotExist:
        print("不存在")

    for book in books:
        print(book.name,book.author)

    return HttpResponse("List success")

def update_book(request):
    try:
        book = Book.objects.get(name="西游记2")
        book.author = '小明2'
        book.save()
        print("修改成功")
    except Book.DoesNotExist:
        print("不存在")

    return HttpResponse("Uodate success")

def delete_book(request):
    try:
        book = Book.objects.get(name="西游记2")
        book.delete()
        print("删除成功")
    except Book.DoesNotExist:
        print("不存在")

    return HttpResponse("Delete success")
