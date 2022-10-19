import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_cache_image.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key? key,
    required this.onTap,
    required this.image,
    required this.lastMessageAuthorPhoto,
    required this.fullName,
    required this.time,
    required this.message,
  }) : super(key: key);
  final Function() onTap;
  final String image;
  final String lastMessageAuthorPhoto;
  final String fullName;
  final String time;
  final String message;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
        child: Row(
          children: [
            BaseCacheImage(size: 80, url: image, borderRadius: 50),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 180,
                        child: Text(
                          fullName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(time),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      BaseCacheImage(
                        size: 20,
                        url: lastMessageAuthorPhoto,
                        borderRadius: 50,
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 150,
                        child: Text(
                          message,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ),
                      // Text(
                      //   message,
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      //   softWrap: false,
                      // )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
