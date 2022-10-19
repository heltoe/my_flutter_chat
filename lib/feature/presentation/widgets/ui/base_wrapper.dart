import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/dimensions.dart';

class BaseWrapper extends StatelessWidget {
  const BaseWrapper({
    Key? key,
    required this.child,
    this.padding = 0,
  }) : super(key: key);
  final Widget child;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding == 0 ? Dimensions.basePadding : padding),
      child: child,
    );
  }
}
