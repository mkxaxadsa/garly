import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../bloc/first_card_bloc.dart';
import 'your_version_field.dart';

class TransportCondition extends StatefulWidget {
  const TransportCondition({super.key});

  @override
  State<TransportCondition> createState() => _TransportConditionState();
}

class _TransportConditionState extends State<TransportCondition> {
  bool expanded = false;

  void onTap(String condition) {
    setState(() {
      expanded = false;
    });
    context
        .read<FirstCardBloc>()
        .add(SelectConditionEvent(condition: condition));
  }

  bool getCurrent(String condition) {
    return context.read<FirstCardBloc>().condition == condition;
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
            height: 35,
            decoration: BoxDecoration(
              color: AppColors.expansion,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const SizedBox(width: 40),
                const Spacer(),
                BlocBuilder<FirstCardBloc, FirstCardState>(
                  builder: (context, state) {
                    if (state is FirstCardSelected) {
                      return Expanded(
                        flex: 10,
                        child: Center(
                          child: Text(
                            state.condition,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: getColor(state.condition),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
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
            title: 'Perfect',
            current: getCurrent('Perfect'),
            color: AppColors.green,
            onPressed: () {
              onTap('Perfect');
            },
          ),
          const SizedBox(height: 8),
          _ExpandedCard(
            title: 'It\'s good',
            current: getCurrent('It\'s good'),
            color: AppColors.orange,
            onPressed: () {
              onTap('It\'s good');
            },
          ),
          const SizedBox(height: 8),
          _ExpandedCard(
            title: 'Old',
            current: getCurrent('Old'),
            color: AppColors.red,
            onPressed: () {
              onTap('Old');
            },
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 7),
              Text(
                'Your version',
                style: TextStyle(
                  color: AppColors.txt,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          YourVersionField(
            onSubmitted: (value) {
              onTap(value);
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
        ],
      ],
    );
  }
}

class _ExpandedCard extends StatelessWidget {
  const _ExpandedCard({
    required this.title,
    required this.current,
    required this.color,
    required this.onPressed,
  });

  final String title;
  final bool current;
  final Color color;
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
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
