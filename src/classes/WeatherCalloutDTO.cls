public class WeatherCalloutDTO {

    public Main main;
    public Wind wind;
    public Integer cod;
    public String name;
    public class Main {
        public Double temp;
        public String pressure;
        public String humidity;
    }
    public class Wind {
        public String speed;
    }
    public static WeatherCalloutDTO parse(String jsonWeather) {
        return (WeatherCalloutDTO) JSON.deserialize(jsonWeather, WeatherCalloutDTO.class);
    }
}