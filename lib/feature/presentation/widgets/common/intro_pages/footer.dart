import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    return Column(
      children: [
        const SizedBox(height: 20),
        Text("© ${date.year} ООО «CHAT»", style: const TextStyle(fontSize: 13, color: Colors.white)),
        const SizedBox(height: 20),
      ],
    );
  }
}

