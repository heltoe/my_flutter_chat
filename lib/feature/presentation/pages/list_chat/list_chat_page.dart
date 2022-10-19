import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/pages/list_chat/widgets/head_list_chat.dart';
import 'package:my_flutter_chat/feature/presentation/pages/list_chat/widgets/list/list_chat.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/layouts/authorized_layout.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/list_helper/list_handler_view.dart';

class ListChatPage extends StatelessWidget {
  const ListChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthorizedLayout(
      child: Column(
        children: const [
          HeadListChat(),
          Expanded(
            child: ListHandlerView(
              emptyMessage: "Список чатов пуст",
              size: 1,
              child: ListChat(),
            ),
          ),
        ],
      ),
    );
  }
}
