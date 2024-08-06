from django.db import models
from django.contrib.auth.models import AbstractUser
from businesses.models import Cuisine, DietaryRestriction, PriceRange
# Create your models here.


class User(AbstractUser):
    first_name = models.CharField(max_length=100, blank=False)
    email = models.EmailField(blank = False, unique = True)
    phone_number = models.CharField(max_length=15, unique=True, blank=False)

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete = models.CASCADE, related_name='profile')
    profile_picture = models.ImageField(upload_to='profile_pictures/')
    bio = models.TextField(blank=True, null=True)

class FoodProfile(models.Model):
    user = models.OneToOneField(User, on_delete = models.CASCADE, related_name='food_profile')
    cuisines = models.ManyToManyField(Cuisine)
    diet = models.ManyToManyField(DietaryRestriction)
    price = models.ForeignKey(PriceRange, on_delete=models.SET_NULL, related_name='food_profile', null=True)

