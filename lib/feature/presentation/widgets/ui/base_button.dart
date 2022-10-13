import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/app_colors.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.bgColor = AppColors.purple1,
    this.color = Colors.white,
    this.text = "",
    required this.onTap,
    this.icon,
  }) : super(key: key);
  final Color bgColor;
  final Color color;
  final String text;
  final IconData? icon;
  final void Function() onTap;

  Widget renderText() {
    return text.isEmpty
        ? const SizedBox()
        : Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          );
  }

  Widget renderIcon() {
    if (icon == null) return const SizedBox();
    return text.isEmpty
        ? Icon(icon, color: color)
        : Row(
            children: [
              const SizedBox(width: 5),
              Icon(icon, color: color),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            renderText(),
            renderIcon(),
          ],
        ),
      ),
    );
  }
}
