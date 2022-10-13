import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/app_colors.dart';
import 'package:my_flutter_chat/common/config.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_button.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_cache_image.dart';

class BlockPhoto extends StatelessWidget {
  const BlockPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BaseCacheImage(
          width: double.maxFinite,
          height: 400,
          url: AppConfig.imageProfile,
          size: 400,
        ),
        Container(
          width: double.maxFinite,
          height: 400,
          color: AppColors.lightBlue.withOpacity(0.25),
        ),
        Center(
          child: SizedBox(
            height: 400,
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BaseButton(
                  text: "Сменить аватар",
                  icon: Icons.upload,
                  onTap: () {},
                ),
                const SizedBox(height: 15),
                BaseButton(
                  text: "Выйти",
                  bgColor: AppColors.red,
                  icon: Icons.exit_to_app_rounded,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}