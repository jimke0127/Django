from django.shortcuts import render,HttpResponse


# Create your views here.
def add_cookie(request):
    res = HttpResponse("设置cookie")
    max_age = 60 * 60
    res.set_cookie("username","jack333",max_age)
    return res

def del_cookie(request):
    res = HttpResponse("删除cookie")
    res.delete_cookie("username")
    return res

def get_cookie(request):
    username =request.COOKIES.get('username')
    print(username)
    #获取全部cookie
    for key,value in request.COOKIES.items():
        print(key,value)

    return HttpResponse("获取cookie")


def add_session(request):
    # 默认过期时间是两周
    request.session['user_id'] = 'zhi le zhi le'
    # 设置为0，浏览器关闭即失效
    request.session.set_expiry(0)
    return HttpResponse("add session")

def get_session(request):
    user_id = request.session.get('user_id')
    print(user_id)
    return HttpResponse("get session")
