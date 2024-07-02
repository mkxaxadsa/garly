import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.onBack,
    this.onEdit,
  });

  final void Function()? onBack;
  final void Function()? onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      color: AppColors.bg,
      child: Row(
        children: [
          CupertinoButton(
            onPressed: onBack ??
                () {
                  context.pop();
                },
            padding: EdgeInsets.zero,
            child: const Row(
              children: [
                SizedBox(width: 25),
                Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.blue,
                ),
                Text(
                  'Back',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          if (onEdit != null) ...[
            const Spacer(),
            CupertinoButton(
              onPressed: onEdit,
              padding: EdgeInsets.zero,
              child: const SizedBox(
                width: 50,
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
