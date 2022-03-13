class WeatherModel {
  final String woeid;
  final String? weatherState;
  final String? weatherStateImage;
  final String? date;
  final String? dateAbbr;
  final int? minTemp;
  final int? minTempFahreneit;
  final int? maxTemp;
  final int? currentTempFahreneit;
  final int? currentTemp;
  final int? maxTempFahreneit;
  final double? windSpeed;
  final double? airPressure;
  final double? humidity;

  WeatherModel(
      {required this.woeid,
      this.weatherState,
      this.weatherStateImage,
      this.date,
      this.dateAbbr,
      this.minTemp,
      this.minTempFahreneit,
      this.maxTemp,
      this.maxTempFahreneit,
      this.currentTemp,
      this.currentTempFahreneit,
      this.windSpeed,
      this.airPressure,
      this.humidity});
}
