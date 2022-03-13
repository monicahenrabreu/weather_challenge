class WeatherModel {
  final String? weatherState;
  final String? weatherStateImage;
  final String? date;
  final String? dateAbbr;
  final int? minTemp;
  final int? maxTemp;
  final int? currentTemp;
  final double? windSpeed;
  final double? airPressure;
  final double? humidity;

  WeatherModel(
      {this.weatherState,
      this.weatherStateImage,
      this.date,
      this.dateAbbr,
      this.minTemp,
      this.maxTemp,
      this.currentTemp,
      this.windSpeed,
      this.airPressure,
      this.humidity});
}
