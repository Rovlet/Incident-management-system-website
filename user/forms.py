from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from .models import Uzytkownik, Sprawa, DetaleNarazonychSystemow

class UzytkownikUserCreationForm(UserCreationForm):

    class Meta:
        model = Uzytkownik
        fields = ('id_osoba',)

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