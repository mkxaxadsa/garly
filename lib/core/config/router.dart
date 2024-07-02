import 'package:go_router/go_router.dart';

import '../../features/news/models/news.dart';
import '../../features/news/pages/news_detail_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/first_card_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/transport/pages/add_transport_page.dart';
import '../../features/transport/pages/edit_transport_page.dart';
import '../../features/transport/pages/transport_detail.dart';
import '../models/transport.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/first-card',
      builder: (context, state) => const FirstCardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/news-detail',
      builder: (context, state) => NewsDetailPage(
        news: state.extra as News,
      ),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => const AddTransportPage(),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) => TransportDetail(
        transport: state.extra as Transport,
      ),
    ),
    GoRoute(
      path: '/edit',
      builder: (context, state) => EditTransportPage(
        transport: state.extra as Transport,
      ),
    ),
  ],
);
