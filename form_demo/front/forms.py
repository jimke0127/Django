from django import forms
from django.core import validators
from .models import Article

#留言板的表单
class MessageBoardForm(forms.Form):

    title = forms.CharField(min_length=2, max_length=20, label='标题',
                            error_messages={"min_length":"标题最小长度不能少于2!","max_length":"标题最大不能超过20!"})
    content = forms.CharField(widget=forms.Textarea, label='内容')
    email = forms.EmailField(label='邮箱')
    telephone = forms.CharField(validators=[validators.RegexValidator(r'1[345678]\d{9}', message='手机号码格式不符合')])
    pwdl = forms.CharField(max_length=12)
    pwd2= forms.CharField(max_length=12)

    # clean_[field]
    def clean_telephone(self):
        telephone =self.cleaned_data.get('telephone')
        #从数据库中查找telephone是否存在，如果存在，那么抛出验证错误
        if telephone == '18888888888':
            raise forms.ValidationError("手机号码已经存在!")
        else:
            return telephone
        
    def clean(self):
        cleaned_data=super().clean()
        pwdl = cleaned_data.get('pwd1')
        pwd2 = cleaned_data.get('pwd2')
        if pwdl != pwd2:
            raise forms.ValidationError('两个密码不一致!')
        

class ArticleForm(forms.Form):
    class Meta:
        model = Article
        #fields = '__all__'
        fields = ['title','content']
        # exclude 标识排除
        # exclude = ['content']
        # 自定义错误信息
        # error_messages = {
        #     'title':{
        #         'max_length':'最多不能超过10个字符!',
        #         'min_1ength':'最少不能少于3个字符!'
        #     },
        #     'content':{
        #         'required':"必须输入content!"
        #     },
        # }




    