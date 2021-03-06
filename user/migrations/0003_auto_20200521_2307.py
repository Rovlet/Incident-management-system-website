# Generated by Django 3.0.6 on 2020-05-21 21:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0002_auto_20200518_1850'),
    ]

    operations = [
        migrations.AddField(
            model_name='zgloszenie',
            name='opis_naprawy',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='rodzajzdarzenia',
            name='nazwa',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='zgloszenie',
            name='czy_przyjete',
            field=models.BooleanField(blank=True, default=False, null=True),
        ),
        migrations.AlterField(
            model_name='zgloszenie',
            name='lokalizacja_zdarzenia',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='zgloszenie',
            name='nazwa_maszyny',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='zgloszenie',
            name='oprogramowanie',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='zgloszenie',
            name='podsiec',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='zgloszenie',
            name='system_operacyjny',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
