import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../bloc/first_card_bloc.dart';
import 'your_version_field.dart';

class TransportType extends StatefulWidget {
  const TransportType({super.key});

  @override
  State<TransportType> createState() => _TransportTypeState();
}

class _TransportTypeState extends State<TransportType> {
  bool expanded = false;

  void onTap(String type) {
    setState(() {
      expanded = false;
    });
    context.read<FirstCardBloc>().add(SelectTypeEvent(type: type));
  }

  bool getCurrent(String type) {
    return context.read<FirstCardBloc>().type == type;
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
                BlocBuilder<FirstCardBloc, FirstCardState>(
                  builder: (context, state) {
                    if (state is FirstCardSelected) {
                      return Text(
                        state.type,
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
            title: 'Boat',
            current: getCurrent('Boat'),
            onPressed: () {
              onTap('Boat');
            },
          ),
          const SizedBox(height: 8),
          _ExpandedCard(
            title: 'Yachts',
            current: getCurrent('Yachts'),
            onPressed: () {
              onTap('Yachts');
            },
          ),
          const SizedBox(height: 8),
          _ExpandedCard(
            title: 'Air cushion',
            current: getCurrent('Air cushion'),
            onPressed: () {
              onTap('Air cushion');
            },
          ),
          const SizedBox(height: 8),
          _ExpandedCard(
            title: 'Jet ski',
            current: getCurrent('Jet ski'),
            onPressed: () {
              onTap('Jet ski');
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
