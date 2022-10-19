import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/list_helper/list_handler_view.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_wrapper.dart';

class CommonListWidget extends StatelessWidget {
  const CommonListWidget({
    Key? key,
    required this.list,
    required this.itemBuilder,
    required this.emptyMessage,
  }) : super(key: key);
  final List list;
  final Widget Function(dynamic, int) itemBuilder;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    return ListHandlerView(
      emptyMessage: emptyMessage,
      size: list.length,
      child: Expanded(
        child: BaseWrapper(
          child: ListView.builder(
            itemCount: list.length + 1,
            itemBuilder: (_, index) {
              bool isLastItem = index < list.length;
              return isLastItem
                  ? itemBuilder(list[index], index)
                  : const SizedBox(height: 20);
            },
          ),
          // child: listBuilder,
        ),
      ),
    );
  }
}
