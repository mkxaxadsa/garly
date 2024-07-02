import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class CommentField extends StatelessWidget {
  const CommentField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.expansion,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'Comment',
          hintStyle: TextStyle(
            color: AppColors.txt,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          onChanged();
        },
      ),
    );
  }
}
