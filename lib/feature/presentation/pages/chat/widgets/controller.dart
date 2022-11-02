import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/app_colors.dart';

class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  TextEditingController message = TextEditingController();

  void onChanged(String message) {}

  void onSend() {
    FocusManager.instance.primaryFocus?.unfocus();
    message.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.grey8,
        border: Border(
          top: BorderSide(width: 1, color: AppColors.grey7),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.attach_file_rounded, color: Colors.grey,),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: message,
              onChanged: onChanged,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Сообщение',
              ),
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              onSend();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.send_rounded, color: message.text.isNotEmpty ? AppColors.purple1 : Colors.grey,),
            ),
          ),
        ],
      ),
    );
  }
}