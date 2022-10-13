import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/app_colors.dart';

class BaseInput extends StatelessWidget {
  const BaseInput({
    Key? key,
    required this.onChanged,
    required this.hintText,
    required this.controller,
    this.disabled = false,
    this.errorText = "",
    this.isPassword = false
  }) : super(key: key);
  final void Function(String value) onChanged;
  final bool disabled;
  final bool isPassword;
  final String hintText;
  final String errorText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey2,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(1, 2),
            blurRadius: 16,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        maxLines: 1,
        controller: controller,
        onChanged: onChanged,
        readOnly: disabled,
        obscureText: isPassword,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          errorMaxLines: 1,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red, width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),

          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red, width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),

          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.grey4.withOpacity(0), width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey4, width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),

          labelText: hintText,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Please enter some text';
        //   }
        //   return null;
        // },
      ),
    );
  }
}
