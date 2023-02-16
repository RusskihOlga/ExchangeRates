import 'package:exchange_rates/core/di.dart';
import 'package:exchange_rates/core/plugins/battery_plugin.dart';
import 'package:exchange_rates/core/resource/colors.dart';
import 'package:exchange_rates/core/resource/images.dart';
import 'package:exchange_rates/presentation/bloc/home/home_bloc.dart';
import 'package:exchange_rates/presentation/bloc/nav/nav_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  final Widget page;

  const MainPage({Key? key, required this.page}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    appIns<BatteryPlugin>().startListener((status) {
      if (status != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(status)));
      }
    });
  }

  @override
  void dispose() {
    appIns<BatteryPlugin>().stopListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => appIns<HomeBloc>()),
        BlocProvider(create: (context) => appIns<NavBloc>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          title: BlocBuilder<NavBloc, NavState>(builder: (context, state) {
            switch (state.index) {
              case 0:
                return const Text("Курсы валют");
              case 1:
                return const Text("Валюты");
              case 2:
                return const Text("Конвертер валют");
            }
            return const Text('');
          }),
        ),
        body: SafeArea(child: widget.page),
        floatingActionButton: BlocBuilder<NavBloc, NavState>(
          builder: (context, state) {
            if (state.index != 0) return const SizedBox();
            return FloatingActionButton(
              onPressed: () => context.read<HomeBloc>().add(LoadRates()),
              backgroundColor: blue,
              child: const Icon(Icons.refresh),
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<NavBloc, NavState>(
          builder: (context, state) {
            return BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: state.index,
              items: const [
                BottomNavigationBarItem(
                  icon: ImageMenu(icon: homeIcon),
                  activeIcon: ImageMenu(icon: homeIcon, color: blue),
                  label: "Главная",
                ),
                BottomNavigationBarItem(
                  icon: ImageMenu(icon: currencyIcon),
                  activeIcon: ImageMenu(icon: currencyIcon, color: blue),
                  label: "Валюты",
                ),
                BottomNavigationBarItem(
                  icon: ImageMenu(icon: convertIcon),
                  activeIcon: ImageMenu(icon: convertIcon, color: blue),
                  label: "Конвертер",
                ),
              ],
              onTap: (index) {
                if (index != state.index) {
                  switch (index) {
                    case 0:
                      context.go("/home");
                      break;
                    case 1:
                      context.go("/currency");
                      break;
                    case 2:
                      context.go("/convert");
                      break;
                  }
                  context.read<NavBloc>().add(NavEvent(index));
                }
              },
              selectedItemColor: blue,
            );
          },
        ),
      ),
    );
  }
}

class ImageMenu extends StatelessWidget {
  final String icon;
  final Color? color;

  const ImageMenu({
    Key? key,
    required this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: color ?? Colors.black,
      width: 15,
    );
  }
}
