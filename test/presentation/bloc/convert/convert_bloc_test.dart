import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:exchange_rates/presentation/bloc/convert/convert_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../domain/repositories/currency_repository_test.dart';

void main() {
  group("ConvertBloc test", () {
    late ConvertBloc convertBloc;
    CurrencyRepositoryMock repository;

    setUp(() {
      EquatableConfig.stringify = true;
      repository = CurrencyRepositoryMock();
      convertBloc = ConvertBloc(repository: repository);
    });

    blocTest<ConvertBloc, ConvertState>(
      "load currencies",
      build: () => convertBloc,
      act: (bloc) => bloc.add(GetCurrencies()),
      expect: () => [
        ShowCurrencies(mockCurrency),
      ],
    );

    blocTest<ConvertBloc, ConvertState>(
      "get currency",
      build: () => convertBloc,
      act: (bloc) => bloc.add(GetCurrency()),
      expect: () => [
        ShowCurrency(mockRates.first),
        ShowResult(0),
      ],
    );

    blocTest<ConvertBloc, ConvertState>(
      "get currency of code",
      build: () => convertBloc,
      act: (bloc) => bloc.add(GetCurrency(code: "USD")),
      expect: () => [
        ShowCurrency(mockRates.firstWhere((element) => element.code == "USD")),
        ShowResult(0),
      ],
    );

    blocTest<ConvertBloc, ConvertState>(
      "convert success",
      build: () => convertBloc,
      act: (bloc) => bloc.add(Convert(code: "USD", value: '65.75')),
      expect: () => [
        ShowResult(3320.375),
      ],
    );

    blocTest<ConvertBloc, ConvertState>(
      "convert failure",
      build: () => convertBloc,
      act: (bloc) => bloc.add(Convert(code: "USD", value: 'value')),
      expect: () => [
        ErrorState(),
      ],
    );

    tearDown(() {
      convertBloc.close();
    });
  });
}
