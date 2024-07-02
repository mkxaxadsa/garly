import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project4/core/models/first.dart';

import '../../core/utils.dart';
import '../../core/widgets/buttons/primary_button.dart';
import 'bloc/first_card_bloc.dart';
import 'widgets/title_text.dart';
import 'widgets/transport_condition.dart';
import 'widgets/transport_count.dart';
import 'widgets/transport_type.dart';

class FirstCardPage extends StatefulWidget {
  const FirstCardPage({super.key});

  @override
  State<FirstCardPage> createState() => _FirstCardPageState();
}

class _FirstCardPageState extends State<FirstCardPage> {
  bool getActive() {
    if (context.read<FirstCardBloc>().type.isNotEmpty &&
        context.read<FirstCardBloc>().count.isNotEmpty &&
        context.read<FirstCardBloc>().condition.isNotEmpty) {
      return true;
    }
    return false;
  }

  void onContinue() async {
    await saveFirsts(First(
      type: context.read<FirstCardBloc>().type,
      count: context.read<FirstCardBloc>().count,
      condition: context.read<FirstCardBloc>().condition,
    )).then((value) {
      context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            children: const [
              SizedBox(height: 51),
              Center(
                child: Text(
                  'Let\'s go',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              SizedBox(height: 34),
              TitleText('What type of your water transport?'),
              SizedBox(height: 9),
              TransportType(),
              SizedBox(height: 24),
              TitleText('How many do you have?'),
              SizedBox(height: 9),
              TransportCount(),
              SizedBox(height: 24),
              TitleText('What is the condition of your transport?'),
              SizedBox(height: 9),
              TransportCondition(),
              SizedBox(height: 144),
            ],
          ),
          BlocBuilder<FirstCardBloc, FirstCardState>(
            builder: (context, state) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 64,
                    left: 30,
                    right: 30,
                  ),
                  child: PrimaryButton(
                    title: 'Continue',
                    active: getActive(),
                    onPressed: onContinue,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
