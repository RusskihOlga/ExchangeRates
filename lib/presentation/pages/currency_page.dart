import 'package:exchange_rates/core/di.dart';
import 'package:exchange_rates/presentation/bloc/currency/currency_bloc.dart';
import 'package:exchange_rates/presentation/widgets/item_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appIns<CurrencyBloc>()..add(GetCurrencies()),
      child: BlocBuilder<CurrencyBloc, CurrencyState>(
        buildWhen: (prev, state) => state is ShowCurrencies,
        builder: (context, state) {
          if (state is ShowCurrencies) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ItemCurrency(currency: state.currencies[index]);
              },
              itemCount: state.currencies.length,
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
