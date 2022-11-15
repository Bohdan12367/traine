public with sharing class WeatherSelector {
    public static List<Weather__c> getByCity(String city) {
        return [SELECT Temperature__c, Pressure__c, Humidity__c, Wind__c, City__c, Date__c,Image__c  FROM Weather__c WHERE City__c  = :city LIMIT 1];
    }
}