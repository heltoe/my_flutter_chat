import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/enums.dart';
import 'package:my_flutter_chat/core/routing.dart';
import 'package:my_flutter_chat/feature/presentation/pages/registration/registration_form.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/intro_pages/base_auth_template.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/layouts/unauthorized_layout.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnauthorizedLayout(
      child: BaseAuthTemplate(
        links: [LinkPage(label: "Вход", namePage: PageEnum.login)],
        textButton: "Зарегестрироваться",
        clickLink: (PageEnum value) {
          context.read<AppRouteDelegate>().goToLogin();
        },
        clickNext: () {
          context.read<AppRouteDelegate>().goToProfile();
        },
        child: const LoginForm(),
      ),
    );
  }
}

