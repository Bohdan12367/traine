public with sharing class WeatherController {
<<<<<<< HEAD
    @AuraEnabled
    public static Weather__c returnWeather(String city){
        return WeatherService.retrieveWeather(city);
=======
    @AuraEnabled(Cacheable=false)
    public static Weather__c handler(String city){
        return WeatherService.handler(city);
>>>>>>> d547c3e7129e73798b704a49128089f329641984
    }
}