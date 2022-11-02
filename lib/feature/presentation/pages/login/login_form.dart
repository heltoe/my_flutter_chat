import 'package:flutter/material.dart';
import 'package:my_flutter_chat/core/routing.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_input.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseInput(
          controller: email,
          hintText: "Email",
          onChanged: (String value) {},
        ),
        const SizedBox(height: 20),
        BaseInput(
          controller: password,
          hintText: "Пароль",
          isPassword: true,
          onChanged: (String value) {},
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            context.read<AppRouteDelegate>().goToRestorePassword();
          },
          child: const Text(
            "Вы забыли пароль?",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}