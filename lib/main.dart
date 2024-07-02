import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/models/transport.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/splash/bloc/first_card_bloc.dart';
import 'features/transport/bloc/transport_bloc.dart';

void main() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('transportbox');
  Hive.registerAdapter(TransportAdapter());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => FirstCardBloc()),
        BlocProvider(create: (context) => TransportBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
