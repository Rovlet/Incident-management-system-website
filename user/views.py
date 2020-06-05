from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import user_passes_test, login_required
from django.contrib.admin.views.decorators import staff_member_required
from django.core.paginator import Paginator
from .models import Uzytkownik, Zgloszenie, RodzajZdarzenia, Priorytet, Status, PoziomIncydentu, Pracownik, Osoba, \
    Sprawa, DetaleNarazonychSystemow, ZrodloIncydentu, Dzial, Kontakt, RodzajIncydentu, Pytanie, SciezkaPytan
from .forms import SprawaForm, DetaleForm, ZrodloForm, UzytkownikUserCreationForm, PracownikForm
from datetime import datetime
from .render import Render
from django.views.generic import View
from django.utils import timezone

class Pdf(View):
    def get(self, request, pk):
        sprawa = Sprawa.objects.get(idsprawa=pk)
        detale = DetaleNarazonychSystemow.objects.get(id_sprawa=pk)
        zrodlo = ZrodloIncydentu.objects.get(id_sprawa=pk)
        today = timezone.now()
        params = {
            'today': today,
            'sprawa': sprawa,
            'detale': detale,
            'zrodlo': zrodlo,
            'request': request
        }
        return Render.render('user/pdf.html', params)


def loginview(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            # Redirect to a success page.
            if 'userlogin' in request.POST:
                return redirect('user-panel')
            if 'conlogin' in request.POST:
                return redirect('cons-panel')
            if 'adminlogin' in request.POST:
                return redirect('admin-panel')
        else:
            return render(request, 'user/login.html', {})
    return render(request, 'user/login.html', {})


@user_passes_test(lambda u: u.is_superuser)
def admin_panel(request):
    return render(request, "user/admin_panel.html")


@staff_member_required
def cons_panel(request):
    return render(request, "user/cons_panel.html")


@login_required
def user_panel(request):
    return render(request, "user/user_panel.html")


@user_passes_test(lambda u: u.is_superuser)
def admin_end(request, pk):
    detale = DetaleNarazonychSystemow.objects.get(iddetale_narazonych_systemow=pk)
    sprawa = detale.id_sprawa
    status = Status.objects.get(idstatus=1)
    user = request.user
    osoba = Uzytkownik.objects.get(username=user.username)
    osoba2 = Osoba.objects.get(idosoba=osoba.id_osoba_id)
    pracownik = Pracownik.objects.get(id_osoba=osoba2)
    if sprawa.id_priorytet_id == 1 and sprawa.id_status == status:
        if request.POST:
            form = ZrodloForm(request.POST)
            if form.is_valid():
                zrodlo = form.save(commit=False)
                zrodlo.id_sprawa = sprawa
                sprawa.id_status_id = 2
                sprawa.id_pracownika = pracownik
                sprawa.skutki_incydentu = request.POST.get('skutki')
                date = datetime.now()
                sprawa.data_zamkniecia = date.strftime("%Y-%m-%d %H:%M:%S")
                zrodlo.save()
                sprawa.save()
                return redirect('admin-ended')
        else:
            form = ZrodloForm()
            return render(request, "user/admin_end.html", {'form': form})
    else:
        return redirect('admin-ended')


@user_passes_test(lambda u: u.is_superuser)
def admin_more(request, pk):
    sprawa = Sprawa.objects.get(idsprawa=pk)
    priorytet = Priorytet.objects.get(waga=10)
    if sprawa.id_priorytet == priorytet:
        if DetaleNarazonychSystemow.objects.filter(id_sprawa=pk).exists():
            detale = DetaleNarazonychSystemow.objects.get(id_sprawa=pk)
            return render(request, "user/admin_more3.html", {'detale': detale})
        return render(request, "user/admin_more.html", {'sprawa': sprawa})


@user_passes_test(lambda u: u.is_superuser)
def admin_endmore(request, pk):
    sprawa = Sprawa.objects.get(idsprawa=pk)
    detale = DetaleNarazonychSystemow.objects.get(id_sprawa=pk)
    zrodlo = ZrodloIncydentu.objects.get(id_sprawa=pk)
    return render(request, "user/admin_endmore.html", {'sprawa': sprawa, 'detale': detale, 'zrodlo': zrodlo})


@user_passes_test(lambda u: u.is_superuser)
def admin_more_details(request, pk):
    sprawa = Sprawa.objects.get(idsprawa=pk)
    if DetaleNarazonychSystemow.objects.filter(idsprawa=pk).exists():
        if ZrodloIncydentu.objects.filter(idsprawa=pk).exists():
            return redirect('cons-endmore', sprawa.idsprawa)
        else:
            detale = DetaleNarazonychSystemow.objects.get(id_sprawa=sprawa.idsprawa)
            return render(request, "user/admin_more3.html", {'detale': detale})
    else:
        if request.POST:
            form = DetaleForm(request.POST)
            if form.is_valid():
                detale = form.save(commit=False)
                detale.id_sprawa = sprawa
                detale.save()
                return redirect('admin-active')
        else:
            form = DetaleForm()
        return render(request, "user/admin_more2.html", {'form': form})


@user_passes_test(lambda u: u.is_superuser)
def admin_active(request):
    logged_sprawa = Sprawa.objects.filter(id_priorytet=1,id_status=1).order_by('idsprawa')
    paginator = Paginator(logged_sprawa, 2)
    page = request.GET.get('page')
    logged_sprawa = paginator.get_page(page)
    return render(request, "user/admin_active.html", {'sprawa': logged_sprawa})


@user_passes_test(lambda u: u.is_superuser)
def admin_ended(request):
    sprawa = Sprawa.objects.filter(id_status_id=2).order_by('-data_zamkniecia')
    paginator = Paginator(sprawa, 2)
    page = request.GET.get('page')
    sprawa = paginator.get_page(page)
    return render(request, "user/admin_ended.html", {'sprawa': sprawa})


@user_passes_test(lambda u: u.is_superuser)
def admin_new_user(request):
    if request.POST:
        imie = request.POST.get('imie')
        nazwisko = request.POST.get('nazwisko')
        Osoba.objects.create(imie=imie, nazwisko=nazwisko)
        return redirect('admin-new-user2')
    return render(request, "user/admin_new_user.html")


@user_passes_test(lambda u: u.is_superuser)
def admin_new_user2(request):
    if request.method == 'POST':
        form = UzytkownikUserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('admin-panel')
    else:
        form = UzytkownikUserCreationForm()
    return render(request, "user/admin_new_user2.html", {'form': form})


@user_passes_test(lambda u: u.is_superuser)
def admin_users(request):
    users = Uzytkownik.objects.all().order_by('iduzytkownik')
    paginator = Paginator(users, 2)
    page = request.GET.get('page')
    users = paginator.get_page(page)
    return render(request, "user/admin_users.html", {'users': users})


@user_passes_test(lambda u: u.is_superuser)
def admin_userpk(request, pk):
    users = Uzytkownik.objects.get(iduzytkownik=pk)
    if request.POST:
        form = PracownikForm(request.POST)
        if form.is_valid():
            if form.cleaned_data["id_dzial"] == Dzial(iddzial=2):
                pracownik = form.save(commit=False)
                pracownik.id_osoba = users.id_osoba
                users.is_staff = True
                pracownik.save()
                users.save()
                return redirect('admin-user')
            elif form.cleaned_data["id_dzial"] == Dzial(iddzial=1):
                pracownik = form.save(commit=False)
                pracownik.id_osoba = users.id_osoba
                users.is_staff = True
                users.is_superuser = True
                pracownik.save()
                users.save()
                return redirect('admin-user')
    else:
        form = PracownikForm()
    return render(request, "user/admin_userpk.html", {'form': form})


@staff_member_required
def cons_active(request):
    logged_zgloszenia = Zgloszenie.objects.all().order_by('czy_przyjete')
    paginator = Paginator(logged_zgloszenia, 2)
    page = request.GET.get('page')
    logged_zgloszenia = paginator.get_page(page)
    return render(request, "user/cons_active.html", {'zgloszenia': logged_zgloszenia})


@staff_member_required
def cons_status(request, pk):
    if request.POST:
        form = SprawaForm(request.POST)
        if form.is_valid():
            sprawa = form.save(commit=False)
            sprawa.id_zgloszenie = Zgloszenie(idzgloszenie=pk)
            zgloszen = Zgloszenie.objects.get(idzgloszenie=pk)
            zgloszen.czy_przyjete = 1
            user = request.user
            user2 = Uzytkownik(username=user.username)
            osoba = Osoba.objects.get(idosoba=user2.id_osoba_id)
            sprawa.id_pracownika = Pracownik.objects.get(id_osoba=osoba.idosoba)
            sprawa.save()
            zgloszen.save()
            return redirect('cons-panel')
    else:
        form = SprawaForm()
    return render(request, "user/cons_status.html", {'form': form})


@staff_member_required
def cons_more(request, pk):
    zgloszenia = Zgloszenie.objects.get(idzgloszenie=pk)
    priorytet = Priorytet.objects.get(waga=1)
    if zgloszenia.czy_przyjete == 1:
        sprawa = Sprawa.objects.get(id_zgloszenie=pk)
        if sprawa.id_priorytet == priorytet:
            if DetaleNarazonychSystemow.objects.filter(id_sprawa=sprawa.idsprawa).exists():
                if ZrodloIncydentu.objects.filter(id_sprawa=sprawa.idsprawa).exists():
                    return redirect('cons-endmore', sprawa.idsprawa)
                else:
                    detale = DetaleNarazonychSystemow.objects.get(id_sprawa=sprawa.idsprawa)
                    return render(request, "user/cons_more3.html", {'detale': detale})
            else:
                if request.POST:
                    form = DetaleForm(request.POST)
                    if form.is_valid():
                        detale = form.save(commit=False)
                        detale.id_sprawa = sprawa
                        detale.save()
                        return redirect('cons-panel')
                else:
                    form = DetaleForm()
                return render(request, "user/cons_more2.html", {'form': form})
        else:
            return render(request, "user/cons_more4.html", {'sprawa': sprawa})
    else:
        return render(request, "user/cons_more.html", {'zgloszenia': zgloszenia})


@staff_member_required
def cons_ended(request):
    sprawa = Sprawa.objects.filter(id_status_id=2).order_by('-data_zamkniecia')
    paginator = Paginator(sprawa, 2)
    page = request.GET.get('page')
    sprawa = paginator.get_page(page)
    return render(request, "user/cons_ended.html", {'sprawa': sprawa})


@staff_member_required
def cons_endmore(request, pk):
    sprawa = Sprawa.objects.get(idsprawa=pk)
    detale = DetaleNarazonychSystemow.objects.get(id_sprawa=pk)
    zrodlo = ZrodloIncydentu.objects.get(id_sprawa=pk)
    return render(request, "user/cons_endmore.html", {'sprawa': sprawa, 'detale': detale, 'zrodlo': zrodlo})


@staff_member_required
def cons_end(request, pk):
    detale = DetaleNarazonychSystemow.objects.get(iddetale_narazonych_systemow=pk)
    sprawa = detale.id_sprawa
    status = Status(idstatus=1)
    user = request.user
    osoba = Uzytkownik.objects.get(username=user.username)
    osoba2 = Osoba.objects.get(idosoba=osoba.id_osoba_id)
    pracownik = Pracownik.objects.get(id_osoba=osoba2)
    if sprawa.id_priorytet_id == 2 and sprawa.id_status == status:
        if request.POST:
            form = ZrodloForm(request.POST)
            if form.is_valid():
                zrodlo = form.save(commit=False)
                zrodlo.id_sprawa = sprawa
                sprawa.id_status_id = 2
                sprawa.id_pracownika = pracownik
                sprawa.skutki_incydentu = request.POST.get('skutki')
                date = datetime.now()
                sprawa.data_zamkniecia = date.strftime("%Y-%m-%d %H:%M:%S")
                zrodlo.save()
                sprawa.save()
                return redirect('cons-panel')
        else:
            form = ZrodloForm()
            return render(request, "user/cons_end2.html", {'form': form})
    else:
        return render(request, "user/cons_end.html")


@login_required
def user_active(request):
    logged = request.user
    logged_zgloszenia = Zgloszenie.objects.filter(id_uzytkownik=logged).order_by('czy_przyjete')
    paginator = Paginator(logged_zgloszenia, 2)
    page = request.GET.get('page')
    logged_zgloszenia = paginator.get_page(page)
    return render(request, "user/user_active.html", {'zgloszenia': logged_zgloszenia})


@login_required
def user_more(request, pk):
    try:
        sprawa = Sprawa.objects.get(id_zgloszenie=pk)
    except:
        sprawa = None
    return render(request, "user/user_more.html", {'sprawa': sprawa})


@login_required
def user_ended(request):
    log_user = request.user
    logged_zgloszenia = Zgloszenie.objects.filter(id_uzytkownik=log_user)
    logged_sprawa = Sprawa.objects.filter(id_status=2,id_zgloszenie__in=logged_zgloszenia)
    paginator = Paginator(logged_sprawa, 2)
    page = request.GET.get('page')
    logged_sprawa = paginator.get_page(page)
    return render(request, "user/user_ended.html", {'sprawa': logged_sprawa})


@login_required
def user_questions(request, pk):
    if pk == 1:
        sciezka = SciezkaPytan.objects.get(id_pytanie_id=1)
        return render(request, "user/user_questions.html", {'sciezka': sciezka})
    elif pk == 2:
        sciezka = SciezkaPytan.objects.get(id_pytanie_id=11)
        return render(request, "user/user_questions.html", {'sciezka': sciezka})
    elif pk == 3:
        sciezka = SciezkaPytan.objects.get(id_pytanie_id=21)
        return render(request, "user/user_questions.html", {'sciezka': sciezka})
    elif pk == 4:
        sciezka = SciezkaPytan.objects.get(id_pytanie_id=26)
        return render(request, "user/user_questions.html", {'sciezka': sciezka})
    elif pk == 5:
        sciezka = SciezkaPytan.objects.get(id_pytanie_id=30)
        return render(request, "user/user_questions.html", {'sciezka': sciezka})
    elif pk == 6:
        sciezka = SciezkaPytan.objects.get(id_pytanie_id=46)
        return render(request, "user/user_questions.html", {'sciezka': sciezka})


@login_required
def user_questions2(request, pk):
    if pk == 10:
        pytanie = Pytanie.objects.get(idpytanie=pk)
        return render(request, "user/user_questions3.html", {'pytanie': pytanie})
    sciezka = SciezkaPytan.objects.get(id_pytanie_id=pk)
    return render(request, "user/user_questions2.html", {'sciezka': sciezka})


@login_required
def user_tree(request):
    rodzaj = RodzajIncydentu.objects.all()
    return render(request, "user/user_tree.html", {'rodzaj': rodzaj})


@login_required
def form(request):
    if request.method == "POST" and 'formularz' in request.POST:
        if len(request.POST.get('email')) < 1 or len(request.POST.get('telefon')) < 1 or \
                len(request.POST.get('datezgloszenia')) or len(request.POST.get('opis')) < 1:
            redirect('form')
        else:
            telefon = request.POST.get('telefon')
            rodzajkontaktu = request.POST.get('kontakt')
            if rodzajkontaktu == "telefon2":
                rodzajkontaktu = "Telefon"
            else:
                rodzajkontaktu = "Email"

            if rodzajkontaktu == "Telefon":
                adres = telefon
            else:
                adres = "email"

            datazgloszenia = request.POST.get('datezgloszenia')
            datawystapienia = request.POST.get('datewystapienia')
            rodzajid = request.POST.get('dostepnosc')
            rodzaj = RodzajZdarzenia(idrodzaj_zdarzenia=rodzajid)
            system = request.POST.get('system')
            oprogramowanie = request.POST.get('oprogramowanie')
            gdzie = request.POST.get('gdzie')
            podsiec = request.POST.get('podsiec')
            naprawa = request.POST.get('naprawa')
            opis = request.POST.get('opis')
            id_uzyt = request.user
            uzytk = Uzytkownik.objects.get(iduzytkownik=id_uzyt.id)
            email = request.POST.get('email')
            Zgloszenie.objects.create(id_uzytkownik=id_uzyt,opis_zdarzenia=opis,opis_naprawy=naprawa,
                                      lokalizacja_zdarzenia=gdzie,data_wystapienia=datawystapienia,
                                      data_zgloszenia=datazgloszenia,nazwa_maszyny=oprogramowanie,system_operacyjny= system,
                                      podsiec=podsiec, id_rodzaj_zdarzenia=rodzaj, oprogramowanie=email)
            Kontakt.objects.create(id_osoba=uzytk.id_osoba,rodzaj_kontaktu=rodzajkontaktu,adres_kontaktowy=adres)
            return render(request, "user/user_panel.html")
    return render(request, "user/form.html")


@login_required
def logout_view(request):
    logout(request)
    return redirect('index')
