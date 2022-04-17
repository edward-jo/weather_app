import 'package:charcode/charcode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/view_models/weather_viewmodel.dart';
import 'package:weather_app/views/common/platform_circular_indicator.dart';
import 'package:weather_icons/weather_icons.dart';

/// Widget that shows current weather information
///
class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late final WeatherViewModel _weatherVM;
  late Stream<WeatherModel> _getWeatherStream;

  @override
  void initState() {
    super.initState();
    _weatherVM = context.read<WeatherViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return _StyledWeatherContainer(
      child: Selector<WeatherViewModel, String>(
        selector: (_, vm) => vm.cityName,
        builder: (_, cityName, __) {
          _getWeatherStream = _weatherVM.getCurrentWeatherStream(
            cityName,
          );
          return StreamBuilder<WeatherModel>(
              stream: _getWeatherStream,
              builder: (context, snapshot) {
                /// Show indicator during waiting
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: PlatformCircularIndicator());
                }

                /// Show error message if occurred
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      style: textTheme.bodyText1,
                    ),
                  );
                }

                final weatherModel = snapshot.data as WeatherModel;
                if (weatherModel.dateTime == null) {
                  return Center(
                    child: Text('No Weather Info', style: textTheme.bodyText1),
                  );
                }

                /// Show fetched weather info
                return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      /// Temperature & Description
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _TemperatureWidget(
                            temperature: weatherModel.temperature,
                          ),
                          _DescriptionWidget(
                            description: weatherModel.description,
                          )
                        ],
                      ),

                      /// Icon
                      _WeatherIconWidget(iconType: weatherModel.iconInfo),
                    ]);
              });
        },
      ),
    );
  }
}

/// Styled Container widget
///
class _StyledWeatherContainer extends StatelessWidget {
  const _StyledWeatherContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      child: child,
    );
  }
}

/// Widget that shows temperature
///
class _TemperatureWidget extends StatelessWidget {
  const _TemperatureWidget({
    Key? key,
    required this.temperature,
  }) : super(key: key);

  final double temperature;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline2!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );

    var temperatureStr = temperature.toStringAsFixed(0);
    temperatureStr += String.fromCharCode($deg);

    return Container(
      alignment: Alignment.center,
      child: Text(temperatureStr, style: textStyle),
    );
  }
}

/// Widget that shows weather description
///
class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({Key? key, this.description}) : super(key: key);

  final String? description;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline6!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );

    return Container(
      alignment: Alignment.center,
      child: Text(description ?? 'No description', style: textStyle),
    );
  }
}

/// Widget that shows weather icon
///
class _WeatherIconWidget extends StatelessWidget {
  _WeatherIconWidget({Key? key, this.iconType}) : super(key: key);

  final String? iconType;

  final Map<String, String> _icons = {
    '01d': 'wi-day-sunny',
    '01n': 'wi-night-clear',
    '02d': 'wi-day-cloudy',
    '02n': 'wi-night-cloudy',
    '03d': 'wi-cloud',
    '03n': 'wi-cloud',
    '04d': 'wi-cloudy',
    '04n': 'wi-cloudy',
    '09d': 'wi-showers',
    '09n': 'wi-showers',
    '10d': 'wi-day-rain-mix',
    '10n': 'wi-night-rain-mix',
    '11d': 'wi-thunderstorm',
    '11n': 'wi-thunderstorm',
    '13d': 'wi-snowflake-cold',
    '13n': 'wi-snowflake-cold',
    '50d': 'wi-fog',
    '50n': 'wi-fog',
  };

  @override
  Widget build(BuildContext context) {
    return BoxedIcon(
      WeatherIcons.fromString(
        _icons[iconType ?? '01d']!,
        fallback: WeatherIcons.na,
      ),
      size: weatherIconSize,
    );
  }
}
