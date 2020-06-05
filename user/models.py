from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.


# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Osoba(models.Model):
    idosoba = models.SmallAutoField(db_column='idOsoba', primary_key=True)  # Field name made lowercase.
    imie = models.CharField(max_length=20)
    nazwisko = models.CharField(max_length=30)

    def __str__(self):
        return self.imie + " " + self.nazwisko

    class Meta:
        db_table = 'osoba'


class Uzytkownik(AbstractUser):
    iduzytkownik = models.AutoField(db_column='idUzytkownik', primary_key=True)  # Field name made lowercase.
    id_osoba = models.ForeignKey(Osoba,on_delete=models.CASCADE, db_column='id_osoba', default=1)

    class Meta:
        db_table = 'uzytkownik'


class RodzajZdarzenia(models.Model):
    idrodzaj_zdarzenia = models.SmallAutoField(db_column='idRodzaj_zdarzenia', primary_key=True)  # Field name made lowercase.
    nazwa = models.CharField(max_length=255, blank=True, null=True)

    def __str__(self):
        return self.nazwa

    class Meta:
        db_table = 'rodzaj_zdarzenia'


class Zgloszenie(models.Model):
    idzgloszenie = models.AutoField(db_column='idZgloszenie', primary_key=True)  # Field name made lowercase.
    id_uzytkownik = models.ForeignKey(Uzytkownik, models.DO_NOTHING, db_column='id_uzytkownik')
    id_rodzaj_zdarzenia = models.ForeignKey(RodzajZdarzenia, models.DO_NOTHING, db_column='id_rodzaj_zdarzenia', blank=True, null=True)
    opis_zdarzenia = models.TextField(blank=True, null=True)
    opis_naprawy = models.TextField(blank=True, null=True)
    lokalizacja_zdarzenia = models.CharField(max_length=255, blank=True, null=True)
    data_wystapienia = models.DateTimeField(blank=True, null=True)
    nazwa_maszyny = models.CharField(max_length=255, blank=True, null=True)
    podsiec = models.CharField(max_length=255, blank=True, null=True)
    system_operacyjny = models.CharField(max_length=255, blank=True, null=True)
    oprogramowanie = models.CharField(max_length=255, blank=True, null=True)
    data_zgloszenia = models.DateTimeField(blank=True, null=True)
    czy_przyjete = models.BooleanField(blank=True, null=True, default=False)

    class Meta:
        db_table = 'zgloszenie'


class RodzajIncydentu(models.Model):
    idrodzaj_incydentu = models.SmallAutoField(db_column='idRodzaj_incydentu', primary_key=True)  # Field name made lowercase.
    nazwa = models.CharField(max_length=300, blank=True, null=True)

    def __str__(self):
        return self.nazwa

    class Meta:
        db_table = 'rodzaj_incydentu'


class Diagnoza(models.Model):
    iddiagnoza = models.SmallAutoField(db_column='idDiagnoza', primary_key=True)  # Field name made lowercase.
    id_rodzaj_incydentu = models.ForeignKey(RodzajIncydentu, models.DO_NOTHING, db_column='id_rodzaj_incydentu', blank=True, null=True)
    opis = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'diagnoza'

class Arkusz(models.Model):
    idarkusz = models.AutoField(db_column='idArkusz', primary_key=True)  # Field name made lowercase.
    id_zgloszenie = models.ForeignKey(Zgloszenie, models.DO_NOTHING, db_column='id_zgloszenie', blank=True, null=True)
    id_rodzaj_zdarzenia = models.ForeignKey(RodzajZdarzenia, models.DO_NOTHING, db_column='id_rodzaj_zdarzenia', blank=True, null=True)
    id_ostateczna_diagnoza = models.ForeignKey(Diagnoza, models.DO_NOTHING, db_column='id_ostateczna_diagnoza', blank=True, null=True)

    class Meta:
        db_table = 'arkusz'


class Priorytet(models.Model):
    idpriorytet = models.AutoField(db_column='idPriorytet', primary_key=True)  # Field name made lowercase.
    nazwa = models.CharField(max_length=45, blank=True, null=True)
    waga = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.nazwa

    class Meta:
        db_table = 'priorytet'


class PoziomIncydentu(models.Model):
    idpoziom_incydentu = models.AutoField(db_column='idPoziom_incydentu', primary_key=True)  # Field name made lowercase.
    poziom = models.CharField(db_column='Poziom', max_length=45, blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return self.poziom

    class Meta:
        db_table = 'poziom_incydentu'


class Dzial(models.Model):
    iddzial = models.SmallAutoField(db_column='idDzial', primary_key=True)  # Field name made lowercase.
    nazwa = models.CharField(max_length=45)

    def __str__(self):
        return self.nazwa

    class Meta:
        db_table = 'dzial'


class Pracownik(models.Model):
    idpracownik = models.SmallAutoField(db_column='idPracownik', primary_key=True)  # Field name made lowercase.
    id_osoba = models.OneToOneField(Osoba, models.DO_NOTHING, db_column='id_osoba')
    stanowisko = models.CharField(max_length=45, blank=True, null=True)
    id_dzial = models.ForeignKey(Dzial, models.DO_NOTHING, db_column='id_dzial', blank=True, null=True)

    def __str__(self):
        return self.id_osoba.imie + " " + self.id_osoba.nazwisko

    class Meta:
        db_table = 'pracownik'


class Status(models.Model):
    idstatus = models.AutoField(db_column='idStatus', primary_key=True)  # Field name made lowercase.
    status = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        return self.status

    class Meta:
        db_table = 'status'


class Sprawa(models.Model):
    idsprawa = models.AutoField(db_column='idSprawa', primary_key=True)  # Field name made lowercase.
    id_priorytet = models.ForeignKey(Priorytet, models.DO_NOTHING, db_column='id_priorytet')
    opis_sprawy = models.TextField(blank=True, null=True)
    id_zgloszenie = models.OneToOneField(Zgloszenie, models.DO_NOTHING, db_column='id_zgloszenie')
    data_przyjecia = models.DateTimeField(blank=True, null=True)
    id_status = models.ForeignKey(Status, models.DO_NOTHING, db_column='id_status')
    data_zamkniecia = models.DateTimeField(blank=True, null=True)
    skutki_incydentu = models.TextField(blank=True, null=True)
    id_poziom_incydentu = models.ForeignKey(PoziomIncydentu, models.DO_NOTHING, db_column='id_poziom_incydentu', blank=True, null=True)
    raport_koncowy = models.TextField(blank=True, null=True)
    id_pracownika = models.ForeignKey(Pracownik, models.DO_NOTHING, db_column='id_pracownika', blank=True, null=True)

    class Meta:
        db_table = 'sprawa'


class DetaleNarazonychSystemow(models.Model):
    iddetale_narazonych_systemow = models.AutoField(db_column='idDetale_narazonych_systemow', primary_key=True)  # Field name made lowercase.
    id_sprawa = models.ForeignKey(Sprawa, models.DO_NOTHING, db_column='id_sprawa')
    narazona_jednostka = models.CharField(max_length=45, blank=True, null=True)
    adresy_ip = models.CharField(max_length=45, blank=True, null=True)
    nazwy_domen = models.CharField(max_length=45, blank=True, null=True)
    podstawowe_funkcje = models.CharField(max_length=45, blank=True, null=True)
    systemy_operacyjne = models.CharField(max_length=45, blank=True, null=True)
    narazone_oprogramowanie = models.CharField(max_length=45, blank=True, null=True)
    uzytkownicy_systemu = models.CharField(max_length=45, blank=True, null=True)
    srodki_bezpieczenstwa = models.CharField(max_length=45, blank=True, null=True)
    lokalizacja = models.CharField(max_length=45, blank=True, null=True)
    informacje_dodatkowe = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        db_table = 'detale_narazonych_systemow'


class Kontakt(models.Model):
    idkontakt = models.AutoField(db_column='idKontakt', primary_key=True)  # Field name made lowercase.
    id_osoba = models.OneToOneField(Osoba, models.DO_NOTHING, db_column='id_osoba')
    rodzaj_kontaktu = models.CharField(max_length=45)
    adres_kontaktowy = models.CharField(max_length=60)

    def __str__(self):
        return self.adres_kontaktowy

    class Meta:
        db_table = 'kontakt'


class Pytanie(models.Model):
    idpytanie = models.SmallAutoField(db_column='idPytanie', primary_key=True)  # Field name made lowercase.
    tresc = models.CharField(max_length=300, blank=True, null=True)

    class Meta:
        db_table = 'pytanie'


class Odpowiedz(models.Model):
    idodpowiedz = models.AutoField(db_column='idOdpowiedz', primary_key=True)  # Field name made lowercase.
    id_pytanie = models.OneToOneField(Pytanie, models.DO_NOTHING, db_column='id_pytanie', blank=True, null=True)
    odpowiedz = models.TextField(blank=True, null=True)  # This field type is a guess.
    id_arkusz = models.OneToOneField(Arkusz, models.DO_NOTHING, db_column='id_arkusz', blank=True, null=True)

    class Meta:
        db_table = 'odpowiedz'


class Rozwiazanie(models.Model):
    idrazwiazanie = models.AutoField(db_column='idRazwiazanie', primary_key=True)  # Field name made lowercase.
    id_diagnoza = models.ForeignKey(Diagnoza, models.DO_NOTHING, db_column='id_diagnoza', blank=True, null=True)
    tresc = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'rozwiazanie'


class SciezkaPytan(models.Model):
    idsciezka_pytan = models.AutoField(db_column='idSciezka_pytan', primary_key=True)  # Field name made lowercase.
    id_rodzaj_zdarzenia = models.OneToOneField(RodzajZdarzenia, models.DO_NOTHING, db_column='id_rodzaj_zdarzenia', blank=True, null=True)
    id_pytanie = models.OneToOneField(Pytanie, models.DO_NOTHING, related_name='id_pytanie', db_column='id_pytanie', blank=True, null=True)
    id_next_pytanie_jesli_tak = models.ForeignKey(Pytanie, models.DO_NOTHING, related_name='id_next_pytanie_jesli_tak', db_column='id_next_pytanie_jesli_tak', blank=True, null=True)
    id_next_pytanie_jesli_nie = models.ForeignKey(Pytanie, models.DO_NOTHING, related_name='id_next_pytanie_jesli_nie', db_column='id_next_pytanie_jesli_nie', blank=True, null=True)
    id_diagnoza_jesli_tak = models.OneToOneField(Diagnoza, models.DO_NOTHING, related_name='id_diagnoza_jesli_tak',db_column='id_diagnoza_jesli_tak', blank=True, null=True)
    id_diagnoza_jesli_nie = models.OneToOneField(Diagnoza, models.DO_NOTHING, related_name='id_diagnoza_jesli_nie',db_column='id_diagnoza_jesli_nie', blank=True, null=True)

    class Meta:
        db_table = 'sciezka_pytan'


class SprawaIncydent(models.Model):
    idsprawa_incydent = models.AutoField(db_column='idSprawa_Incydent', primary_key=True)  # Field name made lowercase.
    id_sprawa = models.ForeignKey(Sprawa, models.DO_NOTHING, db_column='id_sprawa')
    id_rodzaj_incydentu = models.ForeignKey(RodzajIncydentu, models.DO_NOTHING, db_column='id_rodzaj_incydentu')

    class Meta:
        db_table = 'sprawa_incydent'


class ZrodloIncydentu(models.Model):
    idzrodlo_incydentu = models.AutoField(db_column='idZrodlo_incydentu', primary_key=True)  # Field name made lowercase.
    id_sprawa = models.ForeignKey(Sprawa, models.DO_NOTHING, db_column='id_sprawa')
    podmiot = models.CharField(max_length=45, blank=True, null=True)
    adresy_ip_zrodla = models.CharField(max_length=45, blank=True, null=True)
    cel_ataku = models.CharField(max_length=45, blank=True, null=True)
    czy_jest_zagrozeniem = models.BooleanField(blank=True, null=True)  # This field type is a guess.
    data_wywolania = models.DateTimeField(blank=True, null=True)


    class Meta:
        db_table = 'zrodlo_incydentu'

