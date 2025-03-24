"""
URL configuration for template_demo project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include

from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),

    path("book/", include("book.urls")),
    path("home/", include("home.urls")),
    path("article/", include("article.urls")),
    path("front/", include("front.urls")),
    path("cookie_learn/", include("cookie_learn.urls")),


] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)  #加这一句是为了访问用户上传的图片，不经过控制器，然后setting.py中要配置好MEDIA_URL和MEDIA_ROOT
