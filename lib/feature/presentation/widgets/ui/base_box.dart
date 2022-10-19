import 'package:flutter/material.dart';

class BaseBox extends StatelessWidget {
  const BaseBox({
    Key? key,
    required this.child,
    this.paddingHorizontal = 20,
    this.paddingVertical = 20,
  }) : super(key: key);
  final Widget child;
  final double paddingHorizontal;
  final double paddingVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
