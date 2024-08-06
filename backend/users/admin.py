from django.contrib import admin
from .models import User, FoodProfile, Profile
# Register your models here.
admin.site.register(User)

admin.site.register(FoodProfile)

admin.site.register(Profile)
