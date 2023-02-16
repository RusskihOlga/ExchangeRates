import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:exchange_rates/presentation/bloc/currency/currency_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../domain/repositories/currency_repository_test.dart';

void main() {
  group("CurrencyBloc test", () {
    late CurrencyBloc currencyBloc;
    CurrencyRepositoryMock repository;

    setUp(() {
      EquatableConfig.stringify = true;
      repository = CurrencyRepositoryMock();
      currencyBloc = CurrencyBloc(repository: repository);
    });

    blocTest<CurrencyBloc, CurrencyState>(
      "load currencies",
      build: () => currencyBloc,
      act: (bloc) => bloc.add(GetCurrencies()),
      expect: () => [
        ShowCurrencies(mockCurrency),
      ],
    );

    blocTest<CurrencyBloc, CurrencyState>(
      "set favorite",
      build: () => currencyBloc,
      act: (bloc) => bloc.add(SetFavorite(code: "USB", status: true)),
      expect: () => [],
    );

    tearDown(() {
      currencyBloc.close();
    });
  });
}
