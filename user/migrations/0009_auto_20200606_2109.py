# Generated by Django 3.0.6 on 2020-06-06 19:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0008_auto_20200605_1155'),
    ]

    operations = [
        migrations.AlterField(
            model_name='detalenarazonychsystemow',
            name='adresy_ip',
            field=models.CharField(blank=True, max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='detalenarazonychsystemow',
            name='informacje_dodatkowe',
            field=models.CharField(blank=True, max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='detalenarazonychsystemow',
            name='lokalizacja',
            field=models.CharField(max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='detalenarazonychsystemow',
            name='narazona_jednostka',
            field=models.CharField(max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='detalenarazonychsystemow',
            name='narazone_oprogramowanie',
            field=models.CharField(max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='detalenarazonychsystemow',
            name='nazwy_domen',
            field=models.CharField(blank=True, max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='detalenarazonychsystemow',
            name='podstawowe_funkcje',
            field=models.CharField(max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='detalenarazonychsystemow',
            name='srodki_bezpieczenstwa',
            field=models.CharField(max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='detalenarazonychsystemow',
            name='systemy_operacyjne',
            field=models.CharField(blank=True, max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='detalenarazonychsystemow',
            name='uzytkownicy_systemu',
            field=models.CharField(blank=True, max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='pracownik',
            name='id_dzial',
            field=models.ForeignKey(db_column='id_dzial', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='user.Dzial'),
        ),
        migrations.AlterField(
            model_name='pracownik',
            name='stanowisko',
            field=models.CharField(max_length=45, null=True),
        ),
        migrations.AlterField(
            model_name='sprawa',
            name='data_przyjecia',
            field=models.DateTimeField(null=True),
        ),
        migrations.AlterField(
            model_name='sprawa',
            name='id_poziom_incydentu',
            field=models.ForeignKey(db_column='id_poziom_incydentu', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='user.PoziomIncydentu'),
        ),
        migrations.AlterField(
            model_name='sprawa',
            name='id_pracownika',
            field=models.ForeignKey(db_column='id_pracownika', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='user.Pracownik'),
        ),
        migrations.AlterField(
            model_name='sprawa',
            name='opis_sprawy',
            field=models.TextField(null=True),
        ),
        migrations.AlterField(
            model_name='zrodloincydentu',
            name='adresy_ip_zrodla',
            field=models.CharField(max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='zrodloincydentu',
            name='cel_ataku',
            field=models.CharField(max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='zrodloincydentu',
            name='czy_jest_zagrozeniem',
            field=models.BooleanField(null=True),
        ),
        migrations.AlterField(
            model_name='zrodloincydentu',
            name='data_wywolania',
            field=models.DateTimeField(null=True),
        ),
        migrations.AlterField(
            model_name='zrodloincydentu',
            name='podmiot',
            field=models.CharField(max_length=300),
        ),
    ]