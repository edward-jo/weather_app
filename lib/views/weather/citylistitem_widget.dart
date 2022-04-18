import 'package:flutter/material.dart';
import 'package:weather_app/services/weather/city.dart';

/// Widget that displays [item] of [CityListWidget].
///
class CityListItemWidget extends StatelessWidget {
  const CityListItemWidget({
    Key? key,
    required this.item,
    required this.onPressed,
  }) : super(key: key);

  final City item;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cityNameTextStyle = textTheme.bodyText1!.copyWith(
      fontSize: 16,
      color: Colors.white,
    );
    final cityInfoTextStyle = textTheme.caption!.copyWith(
      fontSize: 12,
      color: Colors.white,
    );
    final latitude = 'lat: ${item.coord.lat.toStringAsFixed(2)}';
    final longitude = 'lon: ${item.coord.lon.toStringAsFixed(2)}';

    return GestureDetector(
      onTap: onPressed,
      child: _StyledCityListItemContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /// City name
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(item.name, style: cityNameTextStyle),
              ),
              flex: 1,
            ),

            /// City info
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(item.country, style: cityInfoTextStyle),
                  Text(latitude, style: cityInfoTextStyle),
                  Text(longitude, style: cityInfoTextStyle),
                ],
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

/// Styled Container widget.
///
class _StyledCityListItemContainer extends StatelessWidget {
  const _StyledCityListItemContainer({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: child,
    );
  }
}
