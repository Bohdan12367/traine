@IsTest
public class WeatherRestTest {
    @IsTest
    static void TestUpdate() {
        Test.setMock(HttpCalloutMock.class, new WeatherRestMock());
        Weather__c weath = new Weather__c(City__c = 'Lviv', Pressure__c = '1010');
        insert weath;

        Test.startTest();
        Weather__c weather = WeatherController.returnWeather('Lviv');
        Test.stopTest();
        System.assertEquals('1019', weather.Pressure__c);
    }
    @IsTest
    static void TestCreate() {
        Test.setMock(HttpCalloutMock.class, new WeatherRestMock());

        Test.startTest();
        Weather__c weather = WeatherController.returnWeather('Lviv');
        Test.stopTest();
        System.assertEquals('1019', weather.Pressure__c);
    }
<<<<<<< HEAD

    @IsTest
    static void TestFalse() {
        Test.setMock(HttpCalloutMock.class, new WeatherRestMockFalse());

        Test.startTest();
        try {
            WeatherController.returnWeather('Lvivvvv');
        } catch (AuraHandledException e) {
            System.assert(e.getMessage().contains('No forecast for city '));
        }
        Test.stopTest();
    }
=======
>>>>>>> d547c3e7129e73798b704a49128089f329641984
}