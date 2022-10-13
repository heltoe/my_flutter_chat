import 'package:my_flutter_chat/common/enums.dart';
import 'package:my_flutter_chat/feature/presentation/pages/login/login_page.dart';
import 'package:my_flutter_chat/feature/presentation/pages/registration/registration_page.dart';
import 'package:my_flutter_chat/feature/presentation/pages/restore_password/restore_password_page.dart';

class AppRouting {
  void _getLogin() => const LoginPage();
  void _getRegistration() => const RegistrationPage();
  void _getRestorePassword() => const RestorePasswordPage();

  String _getPath(PageEnum page) {
    String localPath = "";
    switch(page) {
      case PageEnum.login:
        localPath = "login";
        break;
      case PageEnum.registration:
        localPath = "registration";
        break;
      case PageEnum.restorePassword:
        localPath = "restore-password";
        break;
      default: localPath = "login";
    }
    return "/$localPath";
  }

  getInitialRoute() {
    return _getPath(PageEnum.login);
  }

   routes() => {
     _getPath(PageEnum.login): _getLogin,
     _getPath(PageEnum.registration): _getRegistration,
     _getPath(PageEnum.restorePassword): _getRestorePassword,
  };
}