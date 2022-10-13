import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/app_colors.dart';

class TogglePage extends StatelessWidget {
  const TogglePage({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                color: AppColors.grey2,
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.purple1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
