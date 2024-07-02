import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../news/pages/news_page.dart';
import '../../settings/pages/settings_page.dart';
import '../../transport/bloc/transport_bloc.dart';
import '../bloc/home_bloc.dart';
import '../widgets/add_new_button.dart';
import '../widgets/empty_data.dart';
import '../widgets/first_card.dart';
import '../widgets/nav_bar.dart';
import '../widgets/transport_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TransportBloc>().add(GetTransportsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeSettings) return const SettingsPage();

                if (state is HomeNews) return const NewsPage();

                return const _HomePage();
              },
            ),
            const NavBar(),
          ],
        ),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<TransportBloc, TransportState>(
          builder: (context, state) {
            if (state is TransportsLoadedState) {
              if (state.transports.isEmpty) return const EmptyData();

              return Padding(
                padding: const EdgeInsets.only(bottom: 75),
                child: ListView(
                  children: [
                    const SizedBox(height: 18),
                    const Center(
                      child: Text(
                        'List of your water transports',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const FirstCard(),
                    const SizedBox(height: 10),
                    ...List.generate(
                      state.transports.length,
                      (index) {
                        return TransportCard(
                          transport: state.transports[index],
                          index: index,
                        );
                      },
                    ),
                    const SizedBox(height: 106),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
        const AddNewButton(),
      ],
    );
  }
}
