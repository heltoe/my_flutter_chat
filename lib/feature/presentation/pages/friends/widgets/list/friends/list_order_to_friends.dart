import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/config.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/widgets/list/common/common_list_widget.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/widgets/list/common/friend_item.dart';

class ListOrderToFriends extends StatelessWidget {
  const ListOrderToFriends({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List list;

  @override
  Widget build(BuildContext context) {
    return CommonListWidget(
      list: list,
      itemBuilder: (item, index) {
        return FriendItem(
          writeMessageHandler: () {},
          image: AppConfig.imageProfile,
          fullName: "Vlad Zhulinskiy",
          isLastItem: list.length == index + 1,
          controller: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.check_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      emptyMessage: "Список заявок в друзья пуст",
    );
  }
}
