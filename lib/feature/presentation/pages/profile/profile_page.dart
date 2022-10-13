import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/pages/profile/widgets/block_photo.dart';
import 'package:my_flutter_chat/feature/presentation/pages/profile/widgets/password_form.dart';
import 'package:my_flutter_chat/feature/presentation/pages/profile/widgets/personal_info_form.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/layouts/authorized_layout.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/header_components/header.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/header_components/left_button.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_wrapper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthorizedLayout(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              leftWidget: LeftButton(onTap: () {}),
            ),
            const BlockPhoto(),
            const SizedBox(height: 20),
            BaseWrapper(
              child: Column(
                children: const [
                  PersonalInfoForm(),
                  SizedBox(height: 40),
                  PasswordForm(),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
