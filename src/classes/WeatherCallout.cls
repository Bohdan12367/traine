public with sharing class WeatherCallout {
    public static String returnResponse(String city) {
        List<Custom_Weather__mdt> customWeather = Custom_Weather__mdt.getAll().values();
        String customWeatherKey = customWeather[0].Key__c;
        String endPoint = 'https://api.openweathermap.org/data/2.5/weather?appid=' + customWeatherKey + '&q=' + city;
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        Http http = new Http();
        request.setEndpoint(endPoint);
        request.setMethod('POST');
        response = http.send(request);
        String responseBody = response.getBody();
        return responseBody;
    }
}