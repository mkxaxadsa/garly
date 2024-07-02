import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class AddTransportPayment extends StatefulWidget {
  const AddTransportPayment({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function() onChanged;

  @override
  State<AddTransportPayment> createState() => _AddTransportPaymentState();
}

class _AddTransportPaymentState extends State<AddTransportPayment> {
  bool expanded = false;

  void onTap(String payment) {
    setState(() {
      expanded = false;
      widget.controller.text = payment;
      widget.onChanged();
    });
  }

  bool getCurrent(String payment) {
    return widget.controller.text == payment;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          onPressed: () {
            setState(() {
              expanded = !expanded;
            });
          },
          padding: EdgeInsets.zero,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.expansion,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const SizedBox(width: 40),
                const Spacer(),
                Text(
                  widget.controller.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                AnimatedRotation(
                  turns: expanded ? 1 / 2 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.icon,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
        if (expanded) ...[
          const SizedBox(height: 8),
          _ExpandedCard(
            title: 'Card',
            current: getCurrent('Card'),
            onPressed: () {
              onTap('Card');
            },
          ),
          const SizedBox(height: 8),
          _ExpandedCard(
            title: 'Cash',
            current: getCurrent('Cash'),
            onPressed: () {
              onTap('Cash');
            },
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

class _ExpandedCard extends StatelessWidget {
  const _ExpandedCard({
    required this.title,
    required this.current,
    required this.onPressed,
  });

  final String title;
  final bool current;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.expansion,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: current ? AppColors.blue : Colors.transparent,
          width: 2,
        ),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
