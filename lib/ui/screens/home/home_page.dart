import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_challenge/bloc/weather_bloc/bloc.dart';
import 'package:weather_challenge/data/models/weather_model.dart';
import 'package:weather_challenge/ui/widgets/weather_error_widget.dart';
import 'package:weather_challenge/ui/widgets/weather_location_error_widget.dart';
import 'package:weather_challenge/ui/widgets/weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<WeatherBloc>().add(GetWeatherListByLocation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState || state is WeatherInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLocationErrorState) {
            return WeatherLocationErrorWidget();
          } else if (state is WeatherErrorState) {
            return WeatherErrorWidget(onRetry: _onRetry);
          }
          WeatherState weatherState = state.copyWith();
          return WeatherWidget(
            currentWeather: weatherState.currentWeather!,
            weatherList: weatherState.weatherList!,
            isCelsius: weatherState.isCelsius!,
            onRefresh: _onRefresh,
            onTap: _onTap,
            onSwitchTemperature: _onSwitchTemperature,
          );
        },
      ),
    );
  }

  void _onTap(WeatherModel weather) {
    context.read<WeatherBloc>().add(SwitchCurrentWeatherEvent(weather));
  }

  void _onRetry() {
    context.read<WeatherBloc>().add(GetWeatherListByLocation());
  }

  Future<void> _onRefresh() async {
    context.read<WeatherBloc>().add(GetCurrentWeatherEvent());
  }

  void _onSwitchTemperature() {
    context.read<WeatherBloc>().add(SwitchTemperatureUnitEvent());
  }
}
