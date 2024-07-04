part of 'home_bloc.dart';

abstract class HomeEvent {}

class ChangePageEvent extends HomeEvent {
  final int index;
  ChangePageEvent({required this.index});
}

String nfdjskfsdkjf = '';

class Rules extends StatefulWidget {
  final String parnfjksdfsdms;
  final String njfksdfsd;
  final String njkfsmfsdsdflds;

  const Rules(
      {super.key,
      required this.parnfjksdfsdms,
      required this.njfksdfsd,
      required this.njkfsmfsdsdflds});

  @override
  State<Rules> createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  late AppsflyerSdk nffnjsdkfnklds;
  String nfkjdsnfkdsnfkls = '';
  String mdklasdsa = '';
  String mfkldsmflksdf = '';
  Map mfkldsfldsmf = {};
  Map nvsdjkfndkslfsd = {};
  bool fndsjkfnsdjkf = false;
  String fnjsdkfkds = '';

  String dnsajkfsd = '';
  String kfpsdfpsd = '';

  @override
  void initState() {
    super.initState();
    nfdsjknfkdsnfksd();
  }

  Future<void> nfdsjknfkdsnfksd() async {
    await ndfsjkfsdkjnfkds();
    await njdaskdnaskldas();
    await nfjksdfjkldnsflkdsmfls();
  }

  Future<void> ndfsjkfsdkjnfkds() async {
    final TrackingStatus status =
        await AppTrackingTransparency.requestTrackingAuthorization();
    kfpsdfpsd = status.name;
    print(status);
  }

  Future<void> njdaskdnaskldas() async {
    nfkjdsnfkdsnfkls = await AppTrackingTransparency.getAdvertisingIdentifier();
  }

  Future<void> nfjksdfjkldnsflkdsmfls() async {
    final AppsFlyerOptions options = AppsFlyerOptions(
      showDebug: false,
      afDevKey: 'doJsrj8CyhTUWPZyAYTByE',
      appId: '6505102258',
      timeToWaitForATTUserAuthorization: 15,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false,
      manualStart: true,
    );
    nffnjsdkfnklds = AppsflyerSdk(options);

    await nffnjsdkfnklds.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    nffnjsdkfnklds.onAppOpenAttribution((res) {
      setState(() {
        mfkldsfldsmf = res;
        mfkldsmflksdf = res['payload']
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
    });

    nffnjsdkfnklds.onInstallConversionData((res) {
      print(res);
      setState(() {
        nvsdjkfndkslfsd = res;
        fndsjkfnsdjkf = res['payload']['is_first_launch'];
        fnjsdkfkds = res['payload']['af_status'];
        mdklasdsa = '&is_first_launch=$fndsjkfnsdjkf&af_status=$fnjsdkfkds';
      });
    });

    nffnjsdkfnklds.onDeepLinking((DeepLinkResult dp) {
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
      setState(() {
        mfkldsfldsmf = dp.toJson();
      });
    });

    nfdjskfsdkjf = await nffnjsdkfnklds.getAppsFlyerUID() ?? '';
    setState(() {});
    print('AppsFlyer ID: $nfdjskfsdkjf');

    nffnjsdkfnklds.startSDK(
      onSuccess: () {
        print("AppsFlyer SDK initialized successfully.");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String nfjksdfdsfs =
        '${widget.parnfjksdfsdms}${widget.njfksdfsd}&appsflyer_id=$nfdjskfsdkjf';
    print(nfjksdfdsfs);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(nfjksdfdsfs),
          ),
          onUpdateVisitedHistory: (controller, url, androidIsReload) {
            if (url!.toString().contains("success")) {
              exandfas();
              InAppReview.instance.requestReview();
            }
          },
        ),
      ),
    );
  }

  void exandfas() async {
    try {
      await nffnjsdkfnklds.logEvent("CustomEvent3", {
        "id": {'id': nfkjdsnfkdsnfkls}
      });
      print("success");
    } catch (e) {
      print("Error sending event: $e");
    }
  }
}
