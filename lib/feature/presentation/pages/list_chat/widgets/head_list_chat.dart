import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/pages/list_chat/widgets/tab_panel.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/header_components/header.dart';

class HeadListChat extends StatelessWidget {
  const HeadListChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Header(
      leftWidget: TabPanel(
        icon: Icons.people,
        onTap: () {},
      ),
      rightWidget: TabPanel(
        icon: Icons.person,
        onTap: () {},
      ),
      isShowLogo: false,
    );
  }
}