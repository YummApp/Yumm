from django.db import models


class Region(models.Model):
    name = models.CharField(max_length = 100, unique = True)

    def __str__(self):
        return self.name

class Cuisine(models.Model):
    name = models.CharField(max_length = 100, unique = True)
    region = models.ForeignKey(Region, on_delete = models.CASCADE)

    def __str__(self):
        return self.name
    

class DietaryRestriction(models.Model):
    name = models.CharField(max_length = 100, unique = True)

    def __str__(self):
        return self.name
    

class PriceRange(models.Model):
    max_price = models.IntegerField(unique = True, default = 1_000_000)

    def __str__(self):
        return 'max price: {self.max_price}'