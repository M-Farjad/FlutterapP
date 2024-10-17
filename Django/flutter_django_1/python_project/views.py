from django.shortcuts import render

# Create your views here.
# Request Handler
def myapp(request):
    return render(request, 'main.html', {'name': 'Farjad'}) # Render the main.html template with the context {'name': 'Django'}.