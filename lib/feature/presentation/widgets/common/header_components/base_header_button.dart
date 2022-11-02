import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/dimensions.dart';

class BaseHeaderButton extends StatelessWidget {
  const BaseHeaderButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.paddingLeft = 0,
    this.paddingRight = 0,
  }) : super(key: key);
  final Function() onTap;
  final Widget child;
  final double paddingLeft;
  final double paddingRight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: paddingLeft == 0 ? Dimensions.basePadding : paddingLeft,
          right: paddingRight == 0 ? Dimensions.basePadding : paddingRight,
        ),
        alignment: Alignment.centerLeft,
        height: Dimensions.heightHeader,
        child: child,
      ),
    );
  }
}
