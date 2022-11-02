import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/config.dart';
import 'package:my_flutter_chat/core/routing.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/header_components/base_header_button.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/header_components/header.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/header_components/left_button.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_cache_image.dart';
import 'package:provider/provider.dart';

class HeadListFriends extends StatelessWidget {
  const HeadListFriends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Header(
      leftWidget: LeftButton(onTap: () {
        context.read<AppRouteDelegate>().goToListChatPage();
      }),
      rightWidget: BaseHeaderButton(
        child: const BaseCacheImage(
          size: 40,
          url: AppConfig.imageProfile,
          borderRadius: 50,
        ),
        onTap: () {
          context.read<AppRouteDelegate>().goToProfile();
        },
      ),
    );
  }
}
