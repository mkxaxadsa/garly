import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';

class FirstCard extends StatefulWidget {
  const FirstCard({super.key});

  @override
  State<FirstCard> createState() => _FirstCardState();
}

class _FirstCardState extends State<FirstCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: expanded ? 215 : 90,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
        color: const Color(0xff282828),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoButton(
        onPressed: () {
          setState(() {
            expanded = !expanded;
          });
        },
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (expanded) ...[
              const SizedBox(height: 10),
              SizedBox(
                child: Row(
                  children: [
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
                    const SizedBox(width: 15),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              _DataRow(
                title: 'Type',
                data: firstType,
                asset: 'water',
              ),
              const SizedBox(height: 12),
              const _DataRow(
                title: 'Rental cost',
                data: '-',
                asset: 'coins',
              ),
              const SizedBox(height: 12),
              const _DataRow(
                title: 'Payment type',
                data: '-',
                asset: 'payment',
              ),
              const SizedBox(height: 12),
              const _DataRow(
                title: 'Who rent',
                data: '-',
                asset: 'smile',
              ),
              const SizedBox(height: 12),
              _DataRow(
                title: 'State',
                data: firstCondition,
                asset: 'settings',
              ),
              const SizedBox(height: 5),
            ] else
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          firstType,
                          style: const TextStyle(
                            color: AppColors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          width: 52,
                          height: 1,
                          color: Colors.white,
                        ),
                        Text(
                          firstCondition,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Center(
                      child: Text(
                        firstCount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        Spacer(),
                        AnimatedRotation(
                          // turns: expanded ? 1 / 2 : 1,
                          turns: 1,
                          duration: Duration(milliseconds: 300),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.icon,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.title,
    required this.data,
    required this.asset,
  });

  final String title;
  final String data;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 13),
        asset == 'coins'
            ? Image.asset('assets/icons/coins.png', height: 24)
            : SvgPicture.asset('assets/icons/$asset.svg'),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            color: AppColors.txt,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Text(
          data,
          style: TextStyle(
            color: title == 'State' ? getColor(data) : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
