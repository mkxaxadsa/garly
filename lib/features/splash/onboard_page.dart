import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/buttons/primary_button.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: [
          // PAGE 1
          Center(
            child: Stack(
              children: [
                Positioned(
                  top: 53,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/icons/anchor.png',
                    height: 325,
                  ),
                ),
                _Content(
                  title: 'Welcome to Garly: Boats',
                  subtitle: 'Add and manage all your\nboats',
                  buttonText: 'Next',
                  onPressed: () {
                    controller.animateToPage(
                      controller.page!.toInt() + 1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ],
            ),
          ),

          // PAGE 2
          Center(
            child: Stack(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Image.asset('assets/icons/wave2.png'),
                  ],
                ),
                Center(
                  child: _Content(
                    title: 'Create your first\ncard',
                    subtitle: 'Write full information about\nyour watercraft',
                    buttonText: 'Go',
                    onPressed: () {
                      context.go('/first-card');
                    },
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

class _Content extends StatelessWidget {
  const _Content({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
  });

  final String title;
  final String subtitle;
  final String buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 74),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: PrimaryButton(
            title: buttonText,
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}
