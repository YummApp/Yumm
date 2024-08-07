from rest_framework import serializers
from .models import User, Profile, FoodProfilecur

class ProfileSerializer(serializers.ModelSerializers):
    class Meta:
        model = Profile
        fields = [
            'user',
            'profile_picture',
            'bio'
        ]

class FoodProfile(serializers.ModelSerializers):
    class Meta:
        model = Profile
        fields = [
            'user',
            'cuisines',
            'diet',
            'price'
        ]