from django.http import HttpResponse
from django.shortcuts import render
from .forms import MessageBoardForm,ArticleForm
from django.views.decorators.http import require_http_methods


# Create your views here.

@require_http_methods(['GET',"POST"])
def index(request):

    if request.method =='GET':
        form = MessageBoardForm()
        return render(request,'index.html',context={'form':form})
    else:
        form = MessageBoardForm(request.POST)
        if form.is_valid():
            title = form.cleaned_data.get('title')
            email = form.cleaned_data.get('email')
            content = form.cleaned_data.get('content')
            telephone = form.cleaned_data.get('telephone')
            return HttpResponse(f"{title},{email},{content},{telephone}")
        else:
            print(form.errors.get_json_data())
            return HttpResponse("表单验证失败")

        

@require_http_methods(['GET',"POST"])
def article_vie(request):

    if request.method =='GET':
        form = MessageBoardForm()
        return render(request,'article.html',context={'form':form})
    else:
        form = ArticleForm(request.POST)
        if form.is_valid():
            title = form.cleaned_data.get('title')
            content = form.cleaned_data.get('content')
            return HttpResponse(f"{title},{content}")
        else:
            print(form.errors.get_json_data())
            return HttpResponse("表单验证失败")
