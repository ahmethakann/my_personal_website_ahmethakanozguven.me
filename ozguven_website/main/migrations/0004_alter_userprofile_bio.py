# Generated by Django 4.1.6 on 2023-02-14 14:01

import ckeditor.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0003_certificate_url'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='bio',
            field=ckeditor.fields.RichTextField(blank=True, null=True),
        ),
    ]
