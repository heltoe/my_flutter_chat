import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/config.dart';
import 'package:my_flutter_chat/feature/presentation/pages/list_chat/widgets/chat_item.dart';

class ListChat extends StatelessWidget {
  const ListChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, index) {
        return ChatItem(
          onTap: () {},
          fullName: "Жулинский Владислав",
          time: "22.13",
          message:
              "asdasdasda sdasdasd asdasds asdasdasda sdasdasd asdasds asdasdasda sdasdasd asdasds",
          image: AppConfig.imageProfile,
          lastMessageAuthorPhoto: AppConfig.imageProfile,
        );
      },
    );
  }
}
