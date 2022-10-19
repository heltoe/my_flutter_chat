import 'package:flutter/material.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_cache_image.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.addToFriendHandler,
    required this.image,
    required this.fullName,
  }) : super(key: key);
  final Function() addToFriendHandler;
  final String image;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
      ),
      child: Column(
        children: [
          BaseCacheImage(
            size: 160,
            height: 160,
            width: MediaQuery.of(context).size.width - 40 - 10,
            url: image,
            borderRadius: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  fullName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: addToFriendHandler,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
                  child: Icon(
                    Icons.person_add_alt_1_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
