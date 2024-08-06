from django.contrib import admin
from .models import User, FoodPreference, Profile
# Register your models here.
admin.site.register(User)

admin.site.register(FoodPreference)

admin.site.register(Profile)
