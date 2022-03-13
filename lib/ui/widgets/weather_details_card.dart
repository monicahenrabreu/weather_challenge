import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_challenge/configs/constants.dart';
import 'package:weather_challenge/data/models/weather_model.dart';
import 'package:weather_challenge/ui/widgets/humidity_pressure_wind_widget.dart';

class WeatherDetailsCard extends StatelessWidget {
  const WeatherDetailsCard({
    Key? key,
    required this.weather,
    this.isCelsius = true,
    required this.onSwitchTemperature,
  }) : super(key: key);

  final WeatherModel weather;
  final bool isCelsius;
  final void Function() onSwitchTemperature;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
            child: Text(
          weather.date!,
          style: Theme.of(context).textTheme.headline2,
        )),
        const Divider(
          height: 16,
        ),
        Text(
          weather.weatherState!,
          style: Theme.of(context).textTheme.headline3,
        ),
        const Divider(
          height: 16,
        ),
        SvgPicture.network(
          '${Constants.urlImage}${weather.weatherStateImage}${Constants.imageFormat}',
          height: 200,
        ),
        const Divider(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isCelsius
                  ? weather.currentTemp.toString()
                  : weather.currentTempFahreneit.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
            MaterialButton(
                onPressed: onSwitchTemperature,
                child: isCelsius
                    ? Text(
                        AppLocalizations.of(context)!.celsius,
                        style: Theme.of(context).textTheme.headline1,
                      )
                    : Text(
                        AppLocalizations.of(context)!.fahrenheit,
                        style: Theme.of(context).textTheme.headline1,
                      )),
          ],
        ),
        const Divider(
          height: 16,
        ),
        HumidityPressureWindWidget(
          humidity: weather.humidity,
          airPressure: weather.airPressure,
          windSpeed: weather.windSpeed,
        ),
      ],
    );
  }
}
