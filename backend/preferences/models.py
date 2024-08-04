from django.db import models

# Create your models here.
class Cuisine(models.Model):
    REGIONS = [
        ('SOUTH_ASIAN', 'South Asian'),
        ('NONE', 'None')
    ]

    CUISINE_TYPE = [
        ('SOUTH_INDIAN', 'South Indian'),
        ('NONE', 'None')
    ]

    region = models.CharField(max_length = 100, choices = REGIONS, default = 'NONE')
    type = models.CharField(max_length = 100, choices = CUISINE_TYPE, default = 'NONE')

    def __str__(self):
        return self.name
    

class DietaryRestriction(models.Model):
    DIETARY_CHOICES = [
        ('VEGAN', 'Vegan'),
        ('GLUTEN_FREE', 'Gluten-Free'),
        ('VEGETARIAN', 'Vegetarian'),
        ('HALAL', 'Halal'),
        ('KOSHER', 'Kosher'),
        ('NONE', 'None')
    ]

    name = models.CharField(max_length = 100, choices = DIETARY_CHOICES, default = 'NONE')

    def __str__(self):
        return self.name
    

class PriceRange(models.Model):
    BUDGET = 15
    MODERATE = 30
    EXPENSIVE = 50
    NONE = 1_000_000

    PRICE_CHOICES = [
        (BUDGET, '$'),
        (MODERATE, '$$'),
        (EXPENSIVE, '$$$'),
        (NONE, '$$$$'),
    ]

    max_price = models.IntegerField(choices = PRICE_CHOICES, default = NONE)

    def __str__(self):
        return 'max price: {self.max_price}'
    
class FoodPreference(models.Model):
    cuisines = models.ManyToManyField(CuisineType, related_name='cuisine_preference')
    diet = models.ManyToManyField(DietaryType, related_name='diet_preference')
    price = models.ForeignKey(CuisineType, related_name='price_preference')

    

