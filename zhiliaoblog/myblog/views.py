from django.shortcuts import render,reverse,redirect
from django.urls.base import reverse_lazy
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_http_methods,require_POST
from .models import Blog,BlogCategory,BlogComment
from .forms import PubBlogForm
from django.http.response import JsonResponse
from django.db.models import Q

# Create your views here.
def index(request):
    q = request.GET.get('q')
    if not q:
        blogs = Blog.objects.all()
    else:
        blogs = Blog.objects.filter(Q(title__icontains=q)| Q(content__icontains=q)).all()

    return render(request,"index.html",context={"blogs": blogs})

def detail(request,blog_id):
    blog = Blog.objects.get(pk=blog_id)
    return render(request,"blog_detail.html",context={'blog':blog})

# @login_required(login_url=reverse_lazy('zlauth:login'))
# 这种需要在setting配置全局的 LOGIN_URL,然后全部需要登录的地方都可以用
@login_required()
@require_http_methods(["GET","POST"])
def pub_blog(request):
    if request.method == 'GET':
        categories =BlogCategory.objects.all()
        return render(request,"pub_blog.html",context={"categories": categories})
    else:
        form = PubBlogForm(request.POST)
        if form.is_valid():
            title =form.cleaned_data.get( 'title')
            content =form.cleaned_data.get( 'content')
            category_id =form.cleaned_data.get( 'category')
            blog = Blog.objects.create(title=title, content=content, category_id=category_id, author=request.user)
            return JsonResponse({"code":200,"message":"博客发布成功!","data":{
                "blog_id":blog.id
            }})
        else:
            print(form.errors)
            return JsonResponse({'code':400,"message":"参数错误!"}) 


@login_required()
@require_POST
def pub_comment(request):
    blog_id =request.POST.get('blog_id')
    content =request.POST.get('content')
    BlogComment.objects.create(content=content, blog_id=blog_id, author=request.user)
    return redirect(reverse("myblog:detail",kwargs={'blog_id': blog_id}))
