import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project4/core/widgets/buttons/primary_button.dart';
import 'package:project4/features/transport/bloc/transport_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/transport.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/dialog_widget.dart';

class TransportDetail extends StatelessWidget {
  const TransportDetail({super.key, required this.transport});

  final Transport transport;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            onEdit: () {
              context.push('/edit', extra: transport);
            },
          ),
          const Text(
            'Info',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          _DataRow(
            title: 'Type',
            data: transport.type,
            asset: 'water',
          ),
          const SizedBox(height: 16),
          _DataRow(
            title: 'Rental cost',
            data: transport.price.isEmpty ? '-' : '${transport.price} \$',
            asset: 'coins',
          ),
          const SizedBox(height: 16),
          _DataRow(
            title: 'Payment type',
            data: transport.payment.isEmpty ? '-' : transport.payment,
            asset: 'payment',
          ),
          const SizedBox(height: 16),
          _DataRow(
            title: 'Who rent',
            data: transport.who,
            asset: 'smile',
          ),
          const SizedBox(height: 16),
          _DataRow(
            title: 'State',
            data: transport.condition,
            asset: 'settings',
          ),
          const SizedBox(height: 24),
          const Text(
            'Comment',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.expansion,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transport.comment,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: PrimaryButton(
              title: 'Delete card',
              asset: 'delete',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogWidget(
                      title: 'Delete card?',
                      onPressed: () {
                        context
                            .read<TransportBloc>()
                            .add(DeleteTransportEvent(id: transport.id));
                        context.pop();
                      },
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 46),
        ],
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
        const SizedBox(width: 24),
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
        const SizedBox(width: 24),
      ],
    );
  }
}
