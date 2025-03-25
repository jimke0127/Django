from django.shortcuts import render,redirect,reverse
from django.http.response import JsonResponse
import string
import random
from django.core.mail import send_mail
from .models import CaptchaModel
from django.views.decorators.http import require_http_methods
from .forms import RegisterForm,LoginForm
from django.contrib.auth import get_user_model,login,logout
from django.contrib.auth.models import User

User = get_user_model()


# Create your views here.
@require_http_methods(["GET","POST"])
def zllogin(request):
    if request.method == "GET":
        return render(request,'login.html')
    else:
        form = LoginForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data.get("email")
            remember = form.cleaned_data.get("remember")
            password = form.cleaned_data.get("password")
            user = User.objects.filter(email=email).first()
            if user and user.check_password(password):
                #登录
                login(request,user)

                # User.is_authenticated

                if not remember:
                    request.session.set_expiry(0)
            
            return redirect('/myblog')
        else:
            print('邮箱或者密码错误')
            form.add_error('email',"邮箱或者密码错误!")
            return render(request,'login.html', context={"form": form})

            #return render(request,'register',context={"form":form})


def zllogout(request):
    
    logout(request)
    return redirect('/myblog')


@require_http_methods(["GET","POST"])
def register(request):
    if request.method == "GET":
        return render(request,'register.html')
    else:
        form = RegisterForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data.get("email")
            username = form.cleaned_data.get("username")
            password = form.cleaned_data.get("password")
            User.objects.create_user(email=email,username=username,password=password)
            return redirect(reverse("zlauth:login"))
        else:
            print(form.errors)
            return redirect(reverse("zlauth:register"))
            #return render(request,'register',context={"form":form})


def send_email(request):
    email = request.GET.get('email')
    if not email:
        return JsonResponse({"code":400,"message":'必须传递邮箱!'})

    # 生成随机的四位验证码
    captcha = "".join(random.sample(string.digits, 4))
    CaptchaModel.objects.update_or_create(email=email, defaults={'captcha':captcha})
    send_mail("请注意你的验证码",message=f"您的注册验证码是:{captcha}",recipient_list=[email],from_email=None)   

    return JsonResponse({"code": 200,"message":"邮箱验证码发送成功!{email}"})
