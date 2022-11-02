import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/app_colors.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_cache_image.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.text,
    required this.date,
    required this.images,
    required this.isFirst,
    required this.bgColor,
    this.maxWidth = double.maxFinite,
  }) : super(key: key);
  final String text;
  final String date;
  final List<String> images;
  final bool isFirst;
  final double maxWidth;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth, minWidth: 60),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      margin: EdgeInsets.only(
          bottom: 10, top: isFirst ? 10 : 0, left: 10, right: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Text(
              date,
              style: const TextStyle(fontSize: 12, color: AppColors.grey1),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              images.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: List.generate(
                          images.length,
                          (index) => BaseCacheImage(
                            size: 120,
                            url: images[index],
                            borderRadius: 8,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              Text(text, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 12),
            ],
          ),
        ],
      ),
    );
  }
}
