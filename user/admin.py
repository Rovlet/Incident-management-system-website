from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin

from .forms import UzytkownikUserCreationForm, UzytkownikUserChangeForm
from .models import Uzytkownik, Osoba, RodzajZdarzenia, Zgloszenie, Arkusz, Priorytet, PoziomIncydentu, Dzial, \
                    Pracownik, Sprawa, DetaleNarazonychSystemow, Diagnoza, Kontakt, Odpowiedz, Pytanie, RodzajIncydentu,\
                    Rozwiazanie, SciezkaPytan, SprawaIncydent, Status, ZrodloIncydentu

class UzytkownikUserAdmin(UserAdmin):
    add_form = UzytkownikUserCreationForm
    form = UzytkownikUserChangeForm
    model = Uzytkownik
    list_display = ['username', 'id_osoba']
    fieldsets = UserAdmin.fieldsets + (
        ('Extra Fields', {'fields': ('id_osoba',)}),
    )


admin.site.register(Uzytkownik, UzytkownikUserAdmin)
admin.site.register(Osoba)
admin.site.register(RodzajZdarzenia)
admin.site.register(Zgloszenie)
admin.site.register(Arkusz)
admin.site.register(Priorytet)
admin.site.register(PoziomIncydentu)
admin.site.register(Dzial)
admin.site.register(Pracownik)
admin.site.register(Sprawa)
admin.site.register(DetaleNarazonychSystemow)
admin.site.register(Diagnoza)
admin.site.register(Kontakt)
admin.site.register(Odpowiedz)
admin.site.register(Pytanie)
admin.site.register(RodzajIncydentu)
admin.site.register(Rozwiazanie)
admin.site.register(SciezkaPytan)
admin.site.register(SprawaIncydent)
admin.site.register(Status)
admin.site.register(ZrodloIncydentu)

