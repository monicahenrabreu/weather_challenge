import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherErrorWidget extends StatelessWidget {
  WeatherErrorWidget({Key? key, required this.onRetry}) : super(key: key);

  void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.error),
              MaterialButton(
                  onPressed: onRetry,
                  color: Colors.white10,
                  child: Text(
                    AppLocalizations.of(context)!.errorTryAgain,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
