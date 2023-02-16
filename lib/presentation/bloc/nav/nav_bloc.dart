import 'package:bloc/bloc.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavState(0)) {
    on<NavEvent>((event, emit) {
      emit(NavState(event.newIndex));
    });
  }
}
