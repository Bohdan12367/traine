public with sharing class WeatherResponse {
    @AuraEnabled
    public static Weather__c assignmentWeather( WeatherCalloutDTO information, List<Weather__c> weathers) {
        Weather__c w  = new Weather__c();
        if(weathers.size() > 0) {
            w = weathers[0];
        }
        if (information.cod == 200) {
            w.City__c = information.name;
            w.Pressure__c = information.main.pressure;
            w.Wind__c = information.wind.speed;
            w.Humidity__c = information.main.humidity;
            w.Temperature__c = information.main.temp - Constants.DIFFERENCE_BETWEEN_CELSIUS_KELVIN;
            if(weathers.isEmpty()) {
                insert w;
            } else {
                update w;
            }
        } else if(information.cod != 200) {
            AuraHandledException auraException =  new AuraHandledException('No forecast for city ');
            auraException.setMessage('No forecast for city ');
            throw auraException;
        }
        return w;
    }
}