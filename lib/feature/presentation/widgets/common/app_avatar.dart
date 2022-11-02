import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/utils.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_cache_image.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    Key? key,
    required this.id,
    required this.size,
    required this.url,
    required this.fullName,
  }) : super(key: key);
  final int id;
  final double size;
  final String url;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return BaseCacheImage(
      size: size,
      url: url,
      errorWidget: CircleAvatar(
        backgroundColor: getColorById(id),
        radius: size,
        child: Text(
          getInitials(fullName),
          style: TextStyle(fontSize: size / 2.5, color: Colors.white, fontWeight: FontWeight.bold),
        ), //Text
      ),
    );
  }
}
