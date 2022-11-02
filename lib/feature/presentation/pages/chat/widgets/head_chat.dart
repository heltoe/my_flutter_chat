import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/config.dart';
import 'package:my_flutter_chat/core/routing.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/app_avatar.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/header_components/base_header_button.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/header_components/header.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/header_components/left_button.dart';
import 'package:provider/provider.dart';

class HeadChat extends StatelessWidget {
  const HeadChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Header(
      isShowLogo: false,
      leftWidget: LeftButton(onTap: () {
        context.read<AppRouteDelegate>().goToListChatPage();
      }),
      rightWidget: Row(
        children: [
          BaseHeaderButton(
            paddingLeft: 10,
            paddingRight: 10,
            onTap: () {},
            child: const Icon(Icons.call_rounded, color: Colors.white,),
          ),
          BaseHeaderButton(
            paddingLeft: 10,
            paddingRight: 10,
            onTap: () {},
            child: const Icon(Icons.video_call_rounded, color: Colors.white,),
          ),
          BaseHeaderButton(
            paddingLeft: 10,
            onTap: () {},
            child: const AppAvatar(
              id: 1,
              size: 40,
              url: "${AppConfig.imageProfile}dasd",
              fullName: "Vlad Zhulinskiy",
            ),
          ),
        ],
      ),
    );
  }
}
