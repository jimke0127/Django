from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.

def index(request):
    username = "Jack"
    #字典
    book = {"name":"三国","author":"haha"}
    #列表
    books = [
        {"name":"三国","author":"haha"},
        {"name":"水货","author":"haha1"},
        {"name":"西游记","author":"haha2"}
    ]


    class Person:
        def __init__(self,realname):
            self.realname = realname


    context = {
        "username": username,
        "book": book,
        "books": books,
        "person": Person("知了知了")
    }


    return render(request,"index.html",context=context)


def baidu(request):

    return render(request,"baidu.html")

def book_detail(request):
    book_id = request.GET.get("book_id")
    return HttpResponse(f"你找的图书id:"+book_id)

def book_detail_path(request,book_id):
    return HttpResponse(f"你找的图书id是{book_id}")
