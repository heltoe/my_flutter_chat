import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/config.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    this.leftWidget = const SizedBox(),
    this.rightWidget = const SizedBox(),
    this.isShowLogo = true,
  }) : super(key: key);
  final Widget leftWidget;
  final Widget rightWidget;
  final bool isShowLogo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConfig.heightHeader,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF9281FF), Color(0xFF6DAAFE)],
        ),
      ),
      child: Stack(
        children: [
          isShowLogo
              ? Container(
                  height: AppConfig.heightHeader,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: const Text(
                    AppConfig.nameApp,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox(),
          SizedBox(
            height: AppConfig.heightHeader,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leftWidget,
                rightWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
