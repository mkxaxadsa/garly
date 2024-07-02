import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class Settinger extends StatelessWidget {
  final String data;

  const Settinger({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(data)),
      ),
    );
  }
}

class _SplashPageState extends State<SplashPage> {
  void _init() async {
    await getData().then(
      (value) {
        Future.delayed(const Duration(seconds: 1), () {
          if (onboarding) {
            context.go('/onboard');
          } else {
            context.go('/home');
          }
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(
          color: AppColors.blue,
        ),
      ),
    );
  }
}
