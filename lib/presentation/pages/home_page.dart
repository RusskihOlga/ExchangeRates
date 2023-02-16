import 'package:exchange_rates/core/di.dart';
import 'package:exchange_rates/core/resource/colors.dart';
import 'package:exchange_rates/presentation/bloc/home/home_bloc.dart';
import 'package:exchange_rates/presentation/bloc/nav/nav_bloc.dart';
import 'package:exchange_rates/presentation/widgets/base_currency.dart';
import 'package:exchange_rates/presentation/widgets/item_rate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeBloc>().add(LoadRates());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, state) => state is Loading || state is ShowRates,
      builder: (context, state) {
        return Stack(
          children: [
            if (state is ShowRates && state.rates.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    const BaseCurrency(
                      code: 'RUB',
                      title: 'Российский рубль',
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 20),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.push("/chart", extra: {
                                "currency": state.rates[index].code,
                              });
                            },
                            child: ItemRate(
                              rate: state.rates[index],
                              isLast: index == state.rates.length - 1,
                            ),
                          );
                        },
                        itemCount: state.rates.length,
                      ),
                    ),
                  ],
                ),
              ),
            if (state is ShowRates && state.rates.isEmpty)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Выберите валюты для отслеживания курса",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.go("/currency");
                        context.read<NavBloc>().add(NavEvent(1));
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: blue),
                      child: const Text("Выбрать"),
                    )
                  ],
                ),
              ),
            if (state is Loading)
              const Center(
                child: CircularProgressIndicator(color: blue),
              ),
          ],
        );
      },
    );
  }
}
