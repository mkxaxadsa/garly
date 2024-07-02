import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class YourVersionField extends StatelessWidget {
  const YourVersionField({super.key, required this.onSubmitted});

  final void Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.expansion,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: MediaQuery.of(context).viewInsets.bottom > 0
                      ? AppColors.blue
                      : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                hintText: '...',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onSubmitted: onSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
