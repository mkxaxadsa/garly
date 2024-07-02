import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/buttons/primary_button.dart';

class AddNewButton extends StatelessWidget {
  const AddNewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 120,
          right: 25,
          left: 25,
        ),
        child: PrimaryButton(
          title: 'Add new transport',
          onPressed: () {
            context.push('/add');
          },
        ),
      ),
    );
  }
}
