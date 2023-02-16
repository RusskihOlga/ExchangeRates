part of 'chart_bloc.dart';

class ChartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadData extends ChartEvent {
  final int type;
  final String code;

  LoadData({
    required this.type,
    required this.code,
  });

  @override
  List<Object?> get props => [type, code];
}

class ChangeType extends ChartEvent {
  final int type;

  ChangeType(this.type);

  @override
  List<Object?> get props => [type];
}
