import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/pages/profile/widgets/profile_form_wrapper.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_input.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm({Key? key}) : super(key: key);

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ProfileFormWrapper(
      title: "Изменить пароль",
      isChanged: false,
      onSave: () {},
      child: Column(
        children: [
          BaseInput(
            controller: password,
            hintText: "Новый пароль",
            onChanged: (String value) {},
          ),
          const SizedBox(height: 20),
          BaseInput(
            controller: rePassword,
            hintText: "Повторите новый пароль",
            onChanged: (String value) {},
          ),
        ],
      ),
    );
  }
}
