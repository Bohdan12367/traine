public with sharing class WeatherController {
    @AuraEnabled
    public static Weather__c returnWeather(String city) {
        return WeatherService.retrieveWeather(city);
    }

}