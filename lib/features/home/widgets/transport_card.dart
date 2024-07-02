import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/transport.dart';
import '../../../core/utils.dart';

class TransportCard extends StatelessWidget {
  const TransportCard({
    super.key,
    required this.transport,
    required this.index,
  });

  final Transport transport;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(width: 25),
            Text(
              '# ${index + 1}',
              style: TextStyle(
                color: AppColors.txt,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Container(
          height: 90,
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: const Color(0xff282828),
            borderRadius: BorderRadius.circular(8),
          ),
          child: CupertinoButton(
            onPressed: () {
              context.push('/detail', extra: transport);
            },
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        transport.type,
                        style: const TextStyle(
                          color: Colors.white,
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
                        transport.condition,
                        style: TextStyle(
                          color: getColor(transport.condition),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${transport.price} \$ / ${transport.rentTime}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset(
                      'assets/icons/coins.png',
                      height: 24,
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        transport.payment,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SvgPicture.asset('assets/icons/payment.svg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
