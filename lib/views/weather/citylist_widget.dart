import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_app/view_models/weather_viewmodel.dart';
import 'package:weather_app/views/weather/citylistitem_widget.dart';

class CityListWidget extends StatefulWidget {
  const CityListWidget({Key? key}) : super(key: key);

  @override
  State<CityListWidget> createState() => _CityListWidgetState();
}

class _CityListWidgetState extends State<CityListWidget> {
  late final WeatherViewModel _weatherVM;

  @override
  void initState() {
    super.initState();
    _weatherVM = context.read<WeatherViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _weatherVM.cityList.length,
        itemBuilder: (context, index) {
          final cityList = _weatherVM.cityList;
          return CityListItemWidget(
            item: cityList[index],
            onPressed: () => _weatherVM.cityName = cityList[index].name,
          );
        },
      ),
    );
  }
}
