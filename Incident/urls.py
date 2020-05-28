"""Incident URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from user import views as user_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('incidents.urls')),
    path('login/', user_views.loginview, name='login'),
    path('logout/', user_views.logout_view, name='logout'),
    path('form/', user_views.form, name='form'),
    path('admin_panel/', user_views.admin_panel, name='admin-panel'),
    path('admin_panel/admin_active/', user_views.admin_active, name='admin-active'),
    path('admin_panel/admin_active/admin_more/<int:pk>/', user_views.admin_more, name='admin-more'),
    path('admin_panel/admin_active/admin_more/admin_more_details/<int:pk>/', user_views.admin_more_details, name='admin-more-details'),
    path('admin_panel/admin_active/admin_more/admin_end/<int:pk>', user_views.admin_end, name='admin-end'),
    path('admin_panel/admin_ended/<int:pk>', user_views.admin_endmore, name='admin-endmore'),
    path('admin_panel/admin_ended/', user_views.admin_ended, name='admin-ended'),
    path('admin_panel/admin_new_user/', user_views.admin_new_user, name='admin-new-user'),
    path('admin_panel/admin_new_user/admin_new_user2/', user_views.admin_new_user2, name='admin-new-user2'),
    path('admin_panel/admin_raport/', user_views.admin_raport, name='admin-raport'),
    path('admin_panel/admin_users/', user_views.admin_users, name='admin-user'),
    path('admin_panel/admin_users/<int:pk>/', user_views.admin_userpk, name='admin-userpk'),
    path('cons_panel/', user_views.cons_panel, name='cons-panel'),
    path('cons_panel/cons_active/', user_views.cons_active, name='cons-active'),
    path('cons_panel/cons_active/cons_more/<int:pk>/', user_views.cons_more, name='cons-more'),
    path('cons_panel/cons_active/cons_more/cons_end/<int:pk>', user_views.cons_end, name='cons-end'),
    path('cons_panel/cons_ended/<int:pk>', user_views.cons_endmore, name='cons-endmore'),
    path('cons_panel/cons_status/<int:pk>/', user_views.cons_status, name='cons-status'),
    path('cons_panel/cons_ended/', user_views.cons_ended, name='cons-ended'),
    path('cons_panel/cons_raport/', user_views.cons_raport, name='cons-raport'),
    path('user_panel/', user_views.user_panel, name='user-panel'),
    path('user_panel/user_tree', user_views.user_tree, name='user-tree'),
    path('user_panel/user_active/', user_views.user_active, name='user-active'),
    path('user_panel/user_active/user_more/<int:pk>/', user_views.user_more, name='user-more'),
    path('user_panel/user_ended/', user_views.user_ended, name='user-ended'),
    path('user_panel/user_questions/', user_views.user_questions, name='user-questions'),
]
