import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/enums.dart';
import 'package:my_flutter_chat/core/routing.dart';
import 'package:my_flutter_chat/feature/presentation/pages/list_chat/widgets/tab_panel.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/header_components/header.dart';
import 'package:provider/provider.dart';

class HeadListChat extends StatelessWidget {
  const HeadListChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Header(
      leftWidget: TabPanel(
        icon: Icons.people,
        onTap: () {
          context.read<AppRouteDelegate>().goToFriendsPage(FriendsPageTypeEnum.friends);
        },
      ),
      rightWidget: TabPanel(
        icon: Icons.person,
        onTap: () {
          context.read<AppRouteDelegate>().goToProfile();
        },
      ),
      isShowLogo: false,
    );
  }
}