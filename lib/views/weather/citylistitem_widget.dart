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
    final coordTextStyle = textTheme.caption!.copyWith(fontSize: 12);
    final latitude = 'lat: ${item.coord.lat.toStringAsFixed(2)}';
    final longitude = 'lon: ${item.coord.lon.toStringAsFixed(2)}';

    return GestureDetector(
      onTap: onPressed,
      child: _CityListItemContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /// City name
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(item.name,
                    style: textTheme.bodyText1!.copyWith(fontSize: 16)),
              ),
              flex: 1,
            ),

            /// City info
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(item.country, style: textTheme.caption),
                  Text(latitude, style: coordTextStyle),
                  Text(longitude, style: coordTextStyle),
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
class _CityListItemContainer extends StatelessWidget {
  const _CityListItemContainer({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: child,
    );
  }
}
