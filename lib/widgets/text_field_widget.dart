import 'package:flutter/material.dart';
import 'package:todo_app/utils/utils.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.title,
      this.controller,
      this.maxlines,
      this.suffixIcon,
      this.readOnly = false,
      required this.hintText});

  final String title;
  final String hintText;
  TextEditingController? controller;
  final int? maxlines;
  final bool readOnly;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        TextField(
          readOnly: readOnly,
          controller: controller,
          maxLines: maxlines,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration:
              InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
          onChanged: (value) {},
        )
      ],
    );
  }
}
