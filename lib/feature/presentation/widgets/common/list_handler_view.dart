import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/list_helper/empty_state.dart';

class ListHandlerView extends StatelessWidget {
  const ListHandlerView({
    Key? key,
    required this.size,
    required this.child,
    required this.emptyMessage,
    this.iconColor = Colors.black,
  }) : super(key: key);
  final int size;
  final Widget child;
  final String emptyMessage;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return size > 0 ? child : EmptyState(iconColor: iconColor, emptyMessage: emptyMessage);
  }
}
