public with sharing class WeatherCallout {
    public static Weather__c handler(String city) {
        String endPoint = 'https://api.openweathermap.org/data/2.5/weather?appid=' + Constants.APIKey + '&q=' + city;
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        Http http = new Http();
        request.setEndpoint(endPoint);
        request.setMethod('POST');
        response = http.send(request);
        return WeatherResponse.handler(response,city);
    }
}