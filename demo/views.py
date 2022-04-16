import ldclient

from django.conf import settings
from django.shortcuts import render
from ldclient.config import Config

ldclient.set_config(Config(settings.LD_KEY))
client = ldclient.get()

show_feature = client.variation("test-feature-1", {"key": "test-key-1"}, False)

def home(request):
    return render(request, "demo.html", {
        "show_feature": show_feature,
        "sdk_key": settings.LD_KEY
    })
