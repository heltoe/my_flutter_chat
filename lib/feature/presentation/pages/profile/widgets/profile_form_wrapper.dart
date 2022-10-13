import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_button.dart';

class ProfileFormWrapper extends StatelessWidget {
  const ProfileFormWrapper({
    Key? key,
    required this.title,
    required this.isChanged,
    required this.child,
    required this.onSave,
  }) : super(key: key);
  final String title;
  final bool isChanged;
  final Widget child;
  final Function() onSave;

  @override
  Widget build(BuildContext context) {
    Widget getChangedFormResult() {
      return isChanged
          ? Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 120,
                    child: BaseButton(
                      text: "Сохранить",
                      onTap: onSave,
                    ),
                  )
                ],
              ),
            )
          : const SizedBox();
    }

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 20),
        child,
        getChangedFormResult(),
      ],
    );
  }
}
