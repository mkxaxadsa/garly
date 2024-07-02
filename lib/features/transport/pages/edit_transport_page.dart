import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/transport.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../splash/widgets/title_text.dart';
import '../bloc/transport_bloc.dart';
import '../widgets/add_transport_condition.dart';
import '../widgets/add_transport_payment.dart';
import '../widgets/add_transport_rent_time.dart';
import '../widgets/add_transport_type.dart';
import '../widgets/comment_field.dart';
import '../widgets/price_field.dart';
import '../widgets/who_field.dart';

class EditTransportPage extends StatefulWidget {
  const EditTransportPage({super.key, required this.transport});

  final Transport transport;

  @override
  State<EditTransportPage> createState() => _EditTransportPageState();
}

class _EditTransportPageState extends State<EditTransportPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();
  final controller7 = TextEditingController();
  bool commentPage = false;
  bool active = true;

  void checkActive() {
    setState(() {
      if (commentPage) {
        if (controller6.text.isEmpty) {
          active = false;
        } else if (controller7.text.isEmpty) {
          active = false;
        } else {
          active = true;
        }
      } else {
        if (controller1.text.isEmpty) {
          active = false;
        } else if (controller2.text.isEmpty) {
          active = false;
        } else if (controller3.text.isEmpty) {
          active = false;
        } else if (controller4.text.isEmpty) {
          active = false;
        } else if (controller5.text.isEmpty) {
          active = false;
        } else {
          active = true;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controller1.text = widget.transport.type;
    controller2.text = widget.transport.price;
    controller3.text = widget.transport.who;
    controller4.text = widget.transport.payment;
    controller5.text = widget.transport.rentTime;
    controller6.text = widget.transport.comment;
    controller7.text = widget.transport.condition;
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    controller7.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          CustomAppBar(
            onBack: () {
              if (commentPage) {
                setState(() {
                  commentPage = false;
                });
              } else {
                context.pop();
              }
            },
          ),
          Expanded(
            child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  children: [
                    const SizedBox(height: 6),
                    const Row(
                      children: [
                        Text(
                          'Add transport',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 23),
                    if (commentPage) ...[
                      const TitleText('Write a comment'),
                      const SizedBox(height: 6),
                      CommentField(
                        controller: controller6,
                        onChanged: checkActive,
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Ship condition',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 30),
                      AddTransportCondition(
                        controller: controller7,
                        onChanged: checkActive,
                      ),
                    ] else ...[
                      const TitleText('Type of water transport'),
                      const SizedBox(height: 6),
                      AddTransportType(
                        controller: controller1,
                        onChanged: checkActive,
                      ),
                      const SizedBox(height: 16),
                      const TitleText('Rental cost'),
                      const SizedBox(height: 6),
                      PriceField(
                        controller: controller2,
                        onChanged: checkActive,
                      ),
                      const SizedBox(height: 16),
                      const TitleText('Who rents?'),
                      const SizedBox(height: 6),
                      WhoField(
                        controller: controller3,
                        onChanged: checkActive,
                      ),
                      const SizedBox(height: 16),
                      const TitleText('Payment type'),
                      const SizedBox(height: 6),
                      AddTransportPayment(
                        controller: controller4,
                        onChanged: checkActive,
                      ),
                      const SizedBox(height: 16),
                      const TitleText('How long is the lease for'),
                      const SizedBox(height: 6),
                      AddTransportRentTime(
                        controller: controller5,
                        onChanged: checkActive,
                      ),
                      const SizedBox(height: 112),
                    ]
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 46,
                      right: 25,
                      left: 25,
                    ),
                    child: PrimaryButton(
                      title: commentPage ? 'Update' : 'Continue',
                      active: active,
                      onPressed: () {
                        if (commentPage) {
                          context.read<TransportBloc>().add(
                                EditTransportEvent(
                                  transport: Transport(
                                    id: widget.transport.id,
                                    type: controller1.text,
                                    price: controller2.text,
                                    who: controller3.text,
                                    payment: controller4.text,
                                    rentTime: controller5.text,
                                    comment: controller6.text,
                                    condition: controller7.text,
                                  ),
                                ),
                              );
                          context.pop();
                        } else {
                          setState(() {
                            commentPage = true;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
