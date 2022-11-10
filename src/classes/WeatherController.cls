public with sharing class WeatherController {
    @AuraEnabled(Cacheable=false)
    public static Weather__c handler(String city){
        return WeatherService.handler(city);
    }
}