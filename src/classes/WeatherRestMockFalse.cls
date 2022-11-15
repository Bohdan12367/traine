
@isTest
global class WeatherRestMockFalse implements HttpCalloutMock{
    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"cod":"404","message":"city not found"}');
        response.setStatusCode(404);
        return response;
    }
}
