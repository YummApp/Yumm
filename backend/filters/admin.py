from django.contrib import admin
from .models import Cuisine, DietaryRestriction, Region, PriceRange
# Register your models here.

admin.site.register(Cuisine)

admin.site.register(DietaryRestriction)

admin.site.register(Region)

admin.site.register(PriceRange)