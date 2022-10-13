import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_input.dart';

class RestorePasswordForm extends StatefulWidget {
  const RestorePasswordForm({Key? key}) : super(key: key);

  @override
  State<RestorePasswordForm> createState() => _RestorePasswordFormState();
}

class _RestorePasswordFormState extends State<RestorePasswordForm> {
  TextEditingController email = TextEditingController();

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
      ],
    );
  }
}
