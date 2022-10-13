import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/pages/profile/widgets/profile_form_wrapper.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_input.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({Key? key}) : super(key: key);

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  TextEditingController name = TextEditingController();
  TextEditingController family = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ProfileFormWrapper(
      title: "Основная информация",
      isChanged: false,
      onSave: () {},
      child: Column(
        children: [
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
            controller: email,
            hintText: "Email",
            onChanged: (String value) {},
          ),
          const SizedBox(height: 20),
          BaseInput(
            controller: phone,
            hintText: "Телефон",
            onChanged: (String value) {},
          ),
        ],
      ),
    );
  }
}
