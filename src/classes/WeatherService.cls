public with sharing class WeatherService {
    public static Weather__c handler(String city) {
        return WeatherCallout.handler(city);
    }
}