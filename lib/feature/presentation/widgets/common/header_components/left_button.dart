import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/header_components/base_header_button.dart';

class LeftButton extends StatelessWidget {
  const LeftButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return BaseHeaderButton(
      onTap: onTap,
      child: const Icon(
        Icons.arrow_back_rounded,
        color: Colors.white,
        size: 36,
      ),
    );
  }
}
