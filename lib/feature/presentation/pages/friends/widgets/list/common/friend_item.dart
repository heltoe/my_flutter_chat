import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_cache_image.dart';

class FriendItem extends StatelessWidget {
  const FriendItem({
    Key? key,
    required this.writeMessageHandler,
    required this.image,
    required this.fullName,
    required this.isLastItem,
    required this.controller,
  }) : super(key: key);
  final Function() writeMessageHandler;
  final String image;
  final String fullName;
  final bool isLastItem;
  final Widget controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 5,
        right: 5,
        top: 5,
        bottom: isLastItem ? 5 : 0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(isLastItem ? 8 : 0),
          bottomRight: Radius.circular(isLastItem ? 8 : 0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseCacheImage(size: 80, url: image, borderRadius: 50),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    fullName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: writeMessageHandler,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          top: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        child: Text("Написать сообщение"),
                      ),
                    ),
                    controller,
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
