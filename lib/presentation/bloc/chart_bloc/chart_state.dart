part of 'chart_bloc.dart';

class ChartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChartInitial extends ChartState {}

class Loading extends ChartState {}

class Error extends ChartState {}

class ShowChart extends ChartState {
  final String title;
  final Map<DateTime, double> data;

  ShowChart({required this.title, required this.data});

  @override
  List<Object?> get props => [title];
}

class ShowType extends ChartState {
  final int type;

  ShowType(this.type);

  @override
  List<Object?> get props => [type];
}