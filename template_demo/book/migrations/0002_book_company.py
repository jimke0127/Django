# Generated by Django 5.1.7 on 2025-03-23 08:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('book', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='company',
            field=models.CharField(default='aaa', max_length=100),
        ),
    ]
