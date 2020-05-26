from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import user_passes_test, login_required
from django.contrib.admin.views.decorators import staff_member_required
from django.core.paginator import Paginator
from .models import Uzytkownik, Zgloszenie, RodzajZdarzenia, Priorytet, Status, PoziomIncydentu, Pracownik, Osoba, \
    Sprawa, DetaleNarazonychSystemow, ZrodloIncydentu
from .forms import SprawaForm, DetaleForm, ZrodloForm
from datetime import datetime


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
def admin_active(request):
    return render(request, "user/admin_active.html")


@user_passes_test(lambda u: u.is_superuser)
def admin_ended(request):
    return render(request, "user/admin_ended.html")


@user_passes_test(lambda u: u.is_superuser)
def admin_new_user(request):
    return render(request, "user/admin_new_user.html")


@user_passes_test(lambda u: u.is_superuser)
def admin_raport(request):
    return render(request, "user/admin_raport.html")


@user_passes_test(lambda u: u.is_superuser)
def admin_users(request):
    return render(request, "user/admin_users.html")


@staff_member_required
def cons_active(request):
    logged_zgloszenia = Zgloszenie.objects.all().order_by('idzgloszenie')
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
    sprawa = Sprawa.objects.filter(id_status_id=2)
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
    if sprawa.id_priorytet_id == 2 and sprawa.id_status == status:
        if request.POST:
            form = ZrodloForm(request.POST)
            if form.is_valid():
                zrodlo = form.save(commit=False)
                zrodlo.id_sprawa = sprawa
                sprawa.id_status_id = 2
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


@staff_member_required
def cons_raport(request):
    return render(request, "user/cons_raport.html")


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
    return render(request, "user/user_ended.html", {'sprawa': logged_sprawa})


@login_required
def user_questions(request):
    return render(request, "user/user_questions.html")


@login_required
def user_tree(request):
    return render(request, "user/user_tree.html")


@login_required
def form(request):
    if request.method == "POST" and 'formularz' in request.POST:
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
        email = request.POST.get('email')
        Zgloszenie.objects.create(id_uzytkownik=id_uzyt,opis_zdarzenia=opis,opis_naprawy=naprawa,
                                  lokalizacja_zdarzenia=gdzie,data_wystapienia=datawystapienia,
                                  data_zgloszenia=datazgloszenia,nazwa_maszyny=oprogramowanie,system_operacyjny= system,
                                  podsiec=podsiec, id_rodzaj_zdarzenia=rodzaj, oprogramowanie=email)
        return render(request, "user/user_panel.html")
    return render(request, "user/form.html")


@login_required
def logout_view(request):
    logout(request)
    return redirect('index')
