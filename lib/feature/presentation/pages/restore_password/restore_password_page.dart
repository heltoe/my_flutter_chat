import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/enums.dart';
import 'package:my_flutter_chat/feature/presentation/pages/restore_password/restore_password_form.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/intro_pages/base_auth_template.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/layouts/unauthorized_layout.dart';

class RestorePasswordPage extends StatelessWidget {
  const RestorePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnauthorizedLayout(
      child: BaseAuthTemplate(
        links: [
          LinkPage(label: "Вход", namePage: PageEnum.login),
          LinkPage(label: "Регистрация", namePage: PageEnum.registration)
        ],
        textButton: "Восстановить пароль",
        clickLink: (PageEnum value) {},
        clickNext: () {},
        child: const RestorePasswordForm(),
      ),
    );
  }
}
