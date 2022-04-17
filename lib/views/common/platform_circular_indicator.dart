import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/views/common/platform_widget_base.dart';

class PlatformCircularIndicator extends PlatformWidgetBase {
  const PlatformCircularIndicator({Key? key}) : super(key: key);

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return const CupertinoActivityIndicator();
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(strokeWidth: 2),
    );
  }
}
