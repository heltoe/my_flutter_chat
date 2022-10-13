import 'package:flutter/material.dart';

class BaseBox extends StatelessWidget {
  const BaseBox({
    Key? key,
    required this.child,
    this.padding = 20,
  }) : super(key: key);
  final Widget child;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
