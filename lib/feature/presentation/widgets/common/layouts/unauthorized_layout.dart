import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/app_colors.dart';

class UnauthorizedLayout extends StatelessWidget {
  const UnauthorizedLayout({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple1,
      body: child,
    );
  }
}
