import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  const AdaptativeTextField(
      {super.key,
      required this.varEditController,
      required this.title,
      required this.mainKeyboard,
      required this.submitFunction});

  final TextEditingController varEditController;
  final String title;
  final TextInputType mainKeyboard;
  final Function(String) submitFunction;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: varEditController,
              keyboardType: mainKeyboard,
              placeholder: title,
              onSubmitted: submitFunction,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: varEditController,
            keyboardType: mainKeyboard,
            decoration: InputDecoration(
              labelText: title,
            ),
            onSubmitted: submitFunction,
          );
  }
}
