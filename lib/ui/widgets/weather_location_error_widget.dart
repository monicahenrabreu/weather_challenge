import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherLocationErrorWidget extends StatelessWidget {
  WeatherLocationErrorWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(AppLocalizations.of(context)!.locationError),
        ),
      ),
    );
  }
}
