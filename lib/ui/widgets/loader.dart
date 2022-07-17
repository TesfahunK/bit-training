import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color? color;
  final double strokeWidth;

  const Loader({Key? key, this.color, this.strokeWidth = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.red),
      ),
    );
  }
}
