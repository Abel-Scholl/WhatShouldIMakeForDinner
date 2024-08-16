from django.db import models

# Create your models here.

class Ingredient(models.Model):
    ingredientName = models.CharField(max_length=45)
    ingredientDescription = models.CharField(max_length=255)
    
class Recipe(models.Model):
    recipeName = models.CharField(max_length=45)
    recipeDescription = models.TextField()
    contributor = models.BigIntegerField() ##author of the recipe
    adaptedFrom  = models.BigIntegerField() ##if a recipe is an edit of a previous recipe, this field will reference that previous recipe
 
    
    
    
    
    