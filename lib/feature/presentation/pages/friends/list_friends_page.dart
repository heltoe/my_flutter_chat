import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/widgets/head_list_friends.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/widgets/list_friends.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/layouts/authorized_layout.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/list_handler_view.dart';

class ListFriendsPage extends StatelessWidget {
  const ListFriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthorizedLayout(
      child: Column(
        children: const [
          HeadListFriends(),
          Expanded(
            child: ListHandlerView(
              emptyMessage: "Список друзей пуст", // Список заявок в друзья пуст
              size: 1,
              child: ListFriends(),
            ),
          ),
        ],
      ),
    );
  }
}
