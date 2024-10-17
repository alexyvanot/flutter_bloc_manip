import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_manip/bloc/counter_event.dart';
import 'package:flutter_bloc_manip/bloc/counter_state.dart';
import 'package:flutter_bloc_manip/bloc/overhead_state.dart';
import 'package:flutter_bloc_manip/bloc/istate.dart';

class CounterBloc extends Bloc<CounterEvent, IState> {
  int count;

  CounterBloc() : count = 0, super(CounterState(count: 0)) {
    on<IncrementEvent>((event, emit) {
      if (count < 10) {
        count += 1;
        emit(CounterState(count: count));
      } else {
        emit(OverheadState(message: "The count can't go above 10"));
      }
    });

    on<DecrementEvent>((event, emit) {
      if (count > 0) {
        count -= 1;
        emit(CounterState(count: count));
      } else {
        emit(OverheadState(message: "The count can't go below 0"));
      }
    });
  }
}