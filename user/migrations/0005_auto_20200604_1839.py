# Generated by Django 3.0.6 on 2020-06-04 16:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0004_auto_20200528_1749'),
    ]

    operations = [
        migrations.AlterField(
            model_name='odpowiedz',
            name='id_arkusz',
            field=models.OneToOneField(blank=True, db_column='id_arkusz', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='user.Arkusz'),
        ),
        migrations.AlterField(
            model_name='odpowiedz',
            name='id_pytanie',
            field=models.OneToOneField(blank=True, db_column='id_pytanie', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='user.Pytanie'),
        ),
    ]
