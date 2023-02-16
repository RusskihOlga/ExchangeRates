import 'package:exchange_rates/core/client.dart';
import 'package:exchange_rates/core/database/database.dart';
import 'package:exchange_rates/core/plugins/battery_plugin.dart';
import 'package:exchange_rates/data/data_sources/currency_local_data_source.dart';
import 'package:exchange_rates/data/data_sources/currency_remote_data_source.dart';
import 'package:exchange_rates/domain/repositories/currency_repository.dart';
import 'package:exchange_rates/presentation/bloc/chart_bloc/chart_bloc.dart';
import 'package:exchange_rates/presentation/bloc/convert/convert_bloc.dart';
import 'package:exchange_rates/presentation/bloc/currency/currency_bloc.dart';
import 'package:exchange_rates/presentation/bloc/home/home_bloc.dart';
import 'package:exchange_rates/presentation/bloc/nav/nav_bloc.dart';
import 'package:get_it/get_it.dart';

final appIns = GetIt.instance;

void setupDI() {
  appIns.registerFactory(() => NavBloc());
  appIns.registerFactory(() => HomeBloc(repository: appIns()));
  appIns.registerFactory(() => CurrencyBloc(repository: appIns()));
  appIns.registerFactory(() => ConvertBloc(repository: appIns()));
  appIns.registerFactory(() => ChartBloc(repository: appIns()));

  appIns.registerLazySingleton(() => CurrencyRepository(
        localSource: appIns(),
        remoteSource: appIns(),
      ));
  appIns.registerLazySingleton(() => CurrencyRemoteDataSource(
        client: appIns(),
      ));
  appIns.registerLazySingleton(() => CurrencyLocalDataSource(
        database: appIns(),
      ));
  appIns.registerLazySingleton(() => Database());
  appIns.registerLazySingleton(() => Client());
  appIns.registerLazySingleton(() => BatteryPlugin());
}
