import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/enums.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/widgets/head_list_friends.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/widgets/list/users/list_all_users.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/widgets/list/friends/list_friends.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/widgets/list/friends/list_order_to_friends.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/widgets/tabs/tab_container.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/layouts/authorized_layout.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_box.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_wrapper.dart';

class ListFriendsPage extends StatelessWidget {
  const ListFriendsPage({Key? key, required this.typePage}) : super(key: key);
  final FriendsPageTypeEnum typePage;

  @override
  Widget build(BuildContext context) {
    return AuthorizedLayout(
      child: Column(
        children: [
          const HeadListFriends(),
          const SizedBox(height: 20),
          const BaseWrapper(
            child: BaseBox(
              paddingVertical: 0,
              paddingHorizontal: 0,
              child: TabContainer(),
            ),
          ),
          if (typePage == FriendsPageTypeEnum.friends) ListFriends(list: [],),
          if (typePage == FriendsPageTypeEnum.requestToFriends) ListOrderToFriends(list: [1,2,3, 1,2,3, 1,2,3, 1,2,3, 1,2,3, 1,2,3]),
          if (typePage == FriendsPageTypeEnum.all) ListAllUsers(list: [1,2,3, 1,2,3, 1,2,3, 1,2,3, 1,2,3, 1,2,]),
        ],
      ),
    );
  }
}
