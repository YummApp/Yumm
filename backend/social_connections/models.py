from django.db import models
from users.models import User

# Create your models here.
class Friendship(models.Model):
    user = models.OneToOneField(User, on_delete = models.CASCADE)
    friend = models.OneToOneField(User, on_delete = models.CASCADE)