from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from .models import Ingredient
# Create your views here.

def index(request):
    template = loader.get_template("wsimfd/index.html")
    context = {
        'author':'Abel',
        'content': 'this is a recipe!'
    }
    return render(request, "wsimfd/index.html", context)