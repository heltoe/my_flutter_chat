import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/config.dart';

class BaseHeaderButton extends StatelessWidget {
  const BaseHeaderButton({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);
  final Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppConfig.basePadding),
        alignment: Alignment.centerLeft,
        height: AppConfig.heightHeader,
        child: child,
      ),
    );
  }
}
