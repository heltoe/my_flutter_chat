import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/enums.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/widgets/tabs/tab_item.dart';

class TabEntity {
  FriendsPageTypeEnum type;
  String title;

  TabEntity({required this.type, required this.title});
}

class TabContainer extends StatefulWidget {
  const TabContainer({Key? key}) : super(key: key);

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  FriendsPageTypeEnum currentTab = FriendsPageTypeEnum.friends;
  List<TabEntity> tabs = [
    TabEntity(
      type: FriendsPageTypeEnum.friends,
      title: "Все друзья",
    ),
    TabEntity(
      type: FriendsPageTypeEnum.requestToFriends,
      title: "Заявки",
    ),
    TabEntity(
      type: FriendsPageTypeEnum.all,
      title: "Найти друзей",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        tabs.length,
            (index) => TabItem(
          isActive: tabs[index].type == currentTab,
          title: tabs[index].title,
          onTap: () {
            setState(() {
              currentTab = tabs[index].type;
            });
          },
        ),
      ),
    );
  }
}
