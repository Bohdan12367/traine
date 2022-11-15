public with sharing class WeatherService {
    public static Weather__c retrieveWeather(String city) {
        String responseWeather = WeatherCallout.returnResponse(city);
        WeatherCalloutDTO informationWeather = WeatherCalloutDTO.parse(responseWeather);
        List<Weather__c> weathers = WeatherSelector.getByCity(city);
        return WeatherResponse.assignmentWeather(informationWeather, weathers);
    }
}