from django.db import models
from users.models import User

# Create your models here.
class Friendship(models.Model):
    user = models.ForeignKey(User, on_delete = models.CASCADE, related_name='friendships_sent')
    friend = models.ForeignKey(User, on_delete = models.CASCADE, related_name='friendships_recieved')