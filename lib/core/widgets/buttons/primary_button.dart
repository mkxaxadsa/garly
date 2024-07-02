import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.active = true,
    this.asset = '',
    required this.onPressed,
  });

  final String title;
  final bool active;
  final String asset;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width > 400 ? 400 : null,
      decoration: BoxDecoration(
        color: active ? AppColors.blue : AppColors.disabledButton,
        borderRadius: BorderRadius.circular(32),
      ),
      child: CupertinoButton(
        onPressed: active ? onPressed : null,
        padding: EdgeInsets.zero,
        child: asset.isEmpty
            ? Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: active ? Colors.white : AppColors.txt,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : Row(
                children: [
                  const SizedBox(width: 40),
                  const Spacer(),
                  Text(
                    title,
                    style: TextStyle(
                      color: active ? Colors.white : AppColors.txt,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset('assets/icons/delete.svg'),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
      ),
    );
  }
}
