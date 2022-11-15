public with sharing class WeatherService {
<<<<<<< HEAD
    public static Weather__c retrieveWeather(String city) {
        String responseWeather = WeatherCallout.returnResponse(city);
        WeatherCalloutDTO informationWeather = WeatherCalloutDTO.parse(responseWeather);
        List<Weather__c> weathers = WeatherSelector.getByCity(city);
        return WeatherResponse.assignmentWeather(informationWeather,weathers);
=======
    public static Weather__c handler(String city) {
        return WeatherCallout.handler(city);
>>>>>>> d547c3e7129e73798b704a49128089f329641984
    }
}