from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from .models import Uzytkownik, Sprawa, DetaleNarazonychSystemow, ZrodloIncydentu, Pracownik


class UzytkownikUserCreationForm(UserCreationForm):

    class Meta:
        model = Uzytkownik
        fields = ('username','password1','password2','id_osoba',)

    def save(self, commit=True):
        user = super(UzytkownikUserCreationForm, self).save(commit=False)
        user.id_osoba = self.cleaned_data['id_osoba']

        if commit:
            user.save()

        return user


class UzytkownikUserChangeForm(UserChangeForm):

    class Meta:
        model = Uzytkownik
        fields = ('id_osoba',)


class SprawaForm(forms.ModelForm):

    class Meta:
        model = Sprawa
        fields = ('opis_sprawy', 'data_przyjecia', 'skutki_incydentu', 'id_priorytet', 'id_status', 'id_poziom_incydentu',)
        widgets = {
            'data_przyjecia': forms.DateInput(attrs={'type': 'date'})
        }


class DetaleForm(forms.ModelForm):

    class Meta:
        model = DetaleNarazonychSystemow
        fields = ('narazona_jednostka', 'adresy_ip', 'nazwy_domen', 'podstawowe_funkcje', 'systemy_operacyjne',
                  'narazone_oprogramowanie', 'uzytkownicy_systemu', 'srodki_bezpieczenstwa', 'lokalizacja',
                  'informacje_dodatkowe',)


class ZrodloForm(forms.ModelForm):

    class Meta:
        model = ZrodloIncydentu
        fields = ('podmiot','adresy_ip_zrodla','cel_ataku','czy_jest_zagrozeniem','data_wywolania',)
        widgets = {
            'data_wywolania': forms.DateTimeInput(attrs={'type': 'date'})
        }


class PracownikForm(forms.ModelForm):

    class Meta:
        model = Pracownik
        fields = ('stanowisko','id_dzial',)
