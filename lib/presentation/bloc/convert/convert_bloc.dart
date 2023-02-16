import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exchange_rates/domain/entities/currency_data.dart';
import 'package:exchange_rates/domain/entities/rate_data.dart';
import 'package:exchange_rates/domain/repositories/currency_repository.dart';

part 'convert_event.dart';

part 'convert_state.dart';

class ConvertBloc extends Bloc<ConvertEvent, ConvertState> {
  final ICurrencyRepository repository;

  ConvertBloc({
    required this.repository,
  }) : super(ConvertInitial()) {
    on<GetCurrency>(_getCurrency);
    on<Convert>(_convert);
    on<GetCurrencies>(_getCurrencies);
  }

  void _getCurrencies(GetCurrencies event, Emitter<ConvertState> emit) async {
    var currencies = repository.getCurrencies();
    emit(ShowCurrencies(currencies));
  }

  void _getCurrency(GetCurrency event, Emitter<ConvertState> emit) {
    var currency = repository.getCurrency(event.code);
    emit(ShowCurrency(currency));
    emit(ShowResult(0));
  }

  void _convert(Convert event, Emitter<ConvertState> emit) {
    try {
      var result = repository.convertCurrency(event.code, event.value);
      emit(ShowResult(result));
    } catch (_) {
      emit(ErrorState());
    }
  }
}
