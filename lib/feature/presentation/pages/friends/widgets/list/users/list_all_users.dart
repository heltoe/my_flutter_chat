import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/config.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/widgets/list/common/common_list_widget.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/widgets/list/users/user_card.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/list_helper/list_handler_view.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_wrapper.dart';

class ListAllUsers extends StatelessWidget {
  const ListAllUsers({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List list;

  @override
  Widget build(BuildContext context) {
    return ListHandlerView(
      emptyMessage: "Список пользователей пуст",
      size: list.length,
      child: Expanded(
        child: BaseWrapper(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GridView.builder(
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 200
              ),
              itemBuilder: (_, index) {
                return UserCard(
                  addToFriendHandler: () {},
                  image: AppConfig.imageProfile,
                  fullName: "Vlad Zhulinskiy",
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
