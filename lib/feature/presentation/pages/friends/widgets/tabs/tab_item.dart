import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/app_colors.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    Key? key,
    required this.isActive,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final bool isActive;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.purple1.withOpacity(isActive ? 1 : 0),
                width: 2,
              ),
            ),
          ),
          duration: const Duration(milliseconds: 300),
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
      ),
    );
  }
}
