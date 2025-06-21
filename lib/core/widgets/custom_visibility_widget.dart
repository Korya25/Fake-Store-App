
import 'package:flutter/material.dart';

class CustomVisibilityWidget extends StatelessWidget {
  const CustomVisibilityWidget({
    super.key,
    required this.visible,
   required this.widget,
  });

  final bool visible;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: widget
    );
  }
}
