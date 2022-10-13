import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/app_colors.dart';

class BaseCheckBox extends StatelessWidget {
  const BaseCheckBox({
    Key? key,
    required this.label,
    required this.onTap,
    required this.selected,
  }) : super(key: key);
  final String label;
  final void Function() onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: AppColors.purple1, width: 1.5),
            ),
            width: 14,
            height: 14,
            padding: const EdgeInsets.all(2),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.purple1.withOpacity(selected ? 1 : 0),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }
}
