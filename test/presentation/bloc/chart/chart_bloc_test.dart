import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:exchange_rates/presentation/bloc/chart_bloc/chart_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../domain/repositories/currency_repository_test.dart';

void main() {
  group("ChartBloc test", () {
    late ChartBloc chartBloc;
    CurrencyRepositoryMock repository;

    setUp(() {
      EquatableConfig.stringify = true;
      repository = CurrencyRepositoryMock();
      chartBloc = ChartBloc(repository: repository);
    });

    blocTest<ChartBloc, ChartState>(
      "load data",
      build: () => chartBloc,
      act: (bloc) => bloc.add(LoadData(type: 0, code: 'USD')),
      expect: () => [
        Loading(),
        ShowChart(title: "Доллар США", data: mockArchive.data)
      ],
    );

    blocTest<ChartBloc, ChartState>(
      "load data failure",
      build: () => chartBloc,
      act: (bloc) => bloc.add(LoadData(type: 1, code: 'USD')),
      expect: () => [
        Loading(),
        Error(),
      ],
    );

    tearDown(() {
      chartBloc.close();
    });
  });
}
