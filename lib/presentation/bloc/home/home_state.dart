part of 'home_bloc.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class Loading extends HomeState {}

class ShowRates extends HomeState {
  final List<RateData> rates;

  ShowRates(this.rates);

  @override
  List<Object?> get props => [rates];
}

