import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/pages/chat/widgets/controller.dart';
import 'package:my_flutter_chat/feature/presentation/pages/chat/widgets/head_chat.dart';
import 'package:my_flutter_chat/feature/presentation/pages/chat/widgets/list/list_message.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/layouts/authorized_layout.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key, required this.idChat}) : super(key: key);
  final int idChat;

  @override
  Widget build(BuildContext context) {
    return AuthorizedLayout(
      child: Column(
        children: [
          const HeadChat(),
          Expanded(
            child: Container(
              color: Colors.white,
              child: const ListMessage(),
            ),
          ),
          const Controller()
        ],
      ),
    );
  }
}
