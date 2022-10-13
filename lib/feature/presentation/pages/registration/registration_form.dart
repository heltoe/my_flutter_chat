import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_checkbox.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_input.dart';

enum MaleEnum {
  man,
  woman
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController family = TextEditingController();
  TextEditingController phone = TextEditingController();
  MaleEnum male = MaleEnum.man;

  void setMale(MaleEnum value) {
    setState(() {
      male = value;
    });
  }

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
        BaseInput(
          controller: rePassword,
          hintText: "Повторите пароль",
          isPassword: true,
          onChanged: (String value) {},
        ),
        const SizedBox(height: 20),
        BaseInput(
          controller: name,
          hintText: "Имя",
          onChanged: (String value) {},
        ),
        const SizedBox(height: 20),
        BaseInput(
          controller: family,
          hintText: "Фамилия",
          onChanged: (String value) {},
        ),
        const SizedBox(height: 20),
        BaseInput(
          controller: phone,
          hintText: "Телефон",
          onChanged: (String value) {},
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            BaseCheckBox(label: "Мужской", onTap: () {setMale(MaleEnum.man);}, selected: male == MaleEnum.man),
            const SizedBox(width: 10),
            BaseCheckBox(label: "Женский", onTap: () {setMale(MaleEnum.woman);}, selected: male == MaleEnum.woman),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
