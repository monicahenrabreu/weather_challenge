import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HumidityPressureWindWidget extends StatelessWidget {
  const HumidityPressureWindWidget(
      {Key? key, this.humidity, this.airPressure, this.windSpeed})
      : super(key: key);

  final double? windSpeed;
  final double? airPressure;
  final double? humidity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text.rich(TextSpan(
          text: AppLocalizations.of(context)!.humidity,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
              fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: '${humidity?.round().toString()}${AppLocalizations.of(context)!.humidityUnit}',
                style: const TextStyle(fontWeight: FontWeight.normal))
          ],
        )),
        const SizedBox(
          height: 12,
        ),
        Text.rich(TextSpan(
          text: AppLocalizations.of(context)!.pressure,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
              fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: '${airPressure?.round().toString()} ${AppLocalizations.of(context)!.pressureUnit}',
                style: const TextStyle(fontWeight: FontWeight.normal))
          ],
        )),
        const SizedBox(
          height: 12,
        ),
        Text.rich(TextSpan(
          text: AppLocalizations.of(context)!.wind,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
              fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: '${windSpeed?.round().toString()} ${AppLocalizations.of(context)!.windUnit}',
                style: const TextStyle(fontWeight: FontWeight.normal))
          ],
        ))
      ],
    );
  }
}
