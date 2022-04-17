import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_app/models/datetime_model.dart';
import 'package:weather_app/view_models/datetime_viewmodel.dart';
import 'package:weather_app/views/common/platform_circular_indicator.dart';

/// Widget that shows current weekday and date
///
class DateTimeWidget extends StatefulWidget {
  const DateTimeWidget({Key? key}) : super(key: key);

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  late final DateTimeViewModel _dateTimeVM;
  late Future<DateTimeModel> _fetchDateTimeFuture;

  @override
  void initState() {
    super.initState();
    _dateTimeVM = context.read<DateTimeViewModel>();
    _fetchDateTimeFuture = _dateTimeVM.fetchCurrentDateTime();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return _StyledDateTimeContainer(
      child: FutureBuilder<DateTimeModel>(
          future: _fetchDateTimeFuture,
          builder: (context, snapshot) {
            /// Show indicator during waiting
            if (snapshot.connectionState != ConnectionState.done) {
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

            /// Show fetched Weekday and Date
            final dateTime = snapshot.data as DateTimeModel;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  dateTime.weekday,
                  style: textTheme.headline3?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  dateTime.date,
                  style: textTheme.caption?.copyWith(fontSize: 20),
                ),
              ],
            );
          }),
    );
  }
}

/// Styled Container widget
///
class _StyledDateTimeContainer extends StatelessWidget {
  const _StyledDateTimeContainer({
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
