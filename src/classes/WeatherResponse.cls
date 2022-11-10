public with sharing class WeatherResponse {
    public static Weather__c handler(HttpResponse response, String city) {
        String temperature;
        Weather__c existingWeather = [SELECT Temperature__c, Pressure__c, Humidity__c, Wind__c, City__c, Date__c, Image__c FROM Weather__c WHERE City__c = :city LIMIT 1];
        if (response.getStatusCode() == 200) {
            Map<String,Object> allData = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
            Map<String,Object> result = (Map<String,Object>)(allData.get('main'));
            Map<String,Object> wind = (Map<String,Object>)(allData.get('wind'));
            temperature = String.valueOf(result.get('temp'));
            existingWeather.Temperature__c = Double.valueOf(temperature) - Constants.Temp;
            existingWeather.Pressure__c = String.valueOf(result.get('pressure'));
            existingWeather.Humidity__c = String.valueOf(result.get('humidity'));
            existingWeather.Wind__c = String.valueOf(wind.get('speed'));
            if(existingWeather != null) {
                update existingWeather;
            } else {
                existingWeather.City__c = String.valueOf(allData.get('name'));
                insert existingWeather;
            }
        }
        return existingWeather;
    }
}