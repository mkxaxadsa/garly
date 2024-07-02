import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../bloc/first_card_bloc.dart';

class TransportCount extends StatefulWidget {
  const TransportCount({super.key});

  @override
  State<TransportCount> createState() => _TransportCountState();
}

class _TransportCountState extends State<TransportCount> {
  bool expanded = false;

  void onTap(String count) {
    setState(() {
      expanded = false;
    });
    context.read<FirstCardBloc>().add(SelectCountEvent(count: count));
  }

  bool getCurrent(String count) {
    return context.read<FirstCardBloc>().count == count;
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
                      return Text(
                        state.count,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
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
            title: '1-3',
            current: getCurrent('1-3'),
            onPressed: () {
              onTap('1-3');
            },
          ),
          const SizedBox(height: 8),
          _ExpandedCard(
            title: '4-8',
            current: getCurrent('4-8'),
            onPressed: () {
              onTap('4-8');
            },
          ),
          const SizedBox(height: 8),
          _ExpandedCard(
            title: 'More than 8',
            current: getCurrent('More than 8'),
            onPressed: () {
              onTap('More than 8');
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
