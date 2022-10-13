import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    Key? key,
    required this.iconColor,
    required this.emptyMessage,
  }) : super(key: key);

  final Color iconColor;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.mail,
            size: 26,
            color: iconColor,
          ),
          const SizedBox(height: 10),
          Text(
            emptyMessage,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}