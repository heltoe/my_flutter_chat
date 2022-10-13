import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/app_colors.dart';

class AuthorizedLayout extends StatelessWidget {
  const AuthorizedLayout({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey5,
        body: child,
      ),
    );
  }
}
