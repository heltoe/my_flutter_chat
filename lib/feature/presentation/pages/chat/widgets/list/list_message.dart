import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/app_colors.dart';
import 'package:my_flutter_chat/common/config.dart';
import 'package:my_flutter_chat/feature/presentation/pages/chat/widgets/list/message.dart';

class ListMessage extends StatelessWidget {
  const ListMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width - 26;
    double fifteenPercentFromMaxWidth = maxWidth / 100 * 15;
    return ListView.builder(
      itemBuilder: (_, index) {
        bool isMy = index % 2 == 0;
        return Align(
          alignment: isMy ? Alignment.centerLeft : Alignment.centerRight,
          child: Message(
            text: "1asdasd1asd",
            date: "20:10",
            bgColor: isMy ? AppColors.lightBlue.withOpacity(0.4) : AppColors.purple1.withOpacity(0.3),
            isFirst: index == 0,
            maxWidth: maxWidth - fifteenPercentFromMaxWidth,
            images: [AppConfig.imageProfile],
          ),
        );
      },
      itemCount: 30,
    );
  }
}
