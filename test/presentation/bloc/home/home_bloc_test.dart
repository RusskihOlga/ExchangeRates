import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:exchange_rates/presentation/bloc/home/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../domain/repositories/currency_repository_test.dart';

void main() {
  group("HomeBloc test", () {
    late HomeBloc homeBloc;
    CurrencyRepositoryMock repository;

    setUp(() {
      EquatableConfig.stringify = true;
      repository = CurrencyRepositoryMock();
      homeBloc = HomeBloc(repository: repository);
    });

    blocTest<HomeBloc, HomeState>(
      "load rates",
      build: () => homeBloc,
      act: (bloc) => bloc.add(LoadRates()),
      expect: () => [
        Loading(),
        ShowRates(mockRates),
      ]
    );

    tearDown(() {
      homeBloc.close();
    });
  });
}
