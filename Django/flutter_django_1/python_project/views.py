from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from . import database
from rest_framework import status

# Create your views here.
# Request Handler
def myapp(request):
    return render(request, 'main.html', {'name': 'Farjad'}) # Render the main.html template with the context {'name': 'Django'}.

@api_view(['GET', 'POST'])
def getData(request):
    if request.method == 'GET':
        data = database.pokedex
        return Response(data)
    elif request.method == 'POST':
        data = request.data
        number = data.get('number')
        try:
            parsedNumber = int(number)
            response_data = {'pokemon': database.pokedex[number], 'status': 'success'}
            return Response(response_data, status=status.HTTP_201_CREATED)
        except:
            response_data = { 'message': 'empty', 'status': 'success'}
            return Response(response_data, status=status.HTTP_201_CREATED)