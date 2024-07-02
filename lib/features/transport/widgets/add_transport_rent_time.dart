import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class AddTransportRentTime extends StatefulWidget {
  const AddTransportRentTime({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function() onChanged;

  @override
  State<AddTransportRentTime> createState() => _AddTransportRentTimeState();
}

class _AddTransportRentTimeState extends State<AddTransportRentTime> {
  void onTap(String rentTime) {
    setState(() {
      widget.controller.text = rentTime;
      widget.onChanged();
    });
  }

  bool getCurrent(String rentTime) {
    return widget.controller.text == rentTime;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _RentTimeCard(
          title: 'Weekly',
          current: getCurrent('Weekly'),
          onPressed: () {
            onTap('Weekly');
          },
        ),
        const SizedBox(width: 16),
        _RentTimeCard(
          title: 'Monthly',
          current: getCurrent('Monthly'),
          onPressed: () {
            onTap('Monthly');
          },
        ),
        const SizedBox(width: 16),
        _RentTimeCard(
          title: 'Annually',
          current: getCurrent('Annually'),
          onPressed: () {
            onTap('Annually');
          },
        ),
      ],
    );
  }
}

class _RentTimeCard extends StatelessWidget {
  const _RentTimeCard({
    required this.title,
    required this.current,
    required this.onPressed,
  });

  final String title;
  final bool current;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 25,
        decoration: BoxDecoration(
          color: AppColors.expansion,
          borderRadius: BorderRadius.circular(12),
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
      ),
    );
  }
}
