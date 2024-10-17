import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_manip/bloc/counter/counter_event.dart';
import 'package:flutter_bloc_manip/bloc/counter/counter_state.dart';
import 'package:flutter_bloc_manip/bloc/counter/overhead_state.dart';
import 'package:flutter_bloc_manip/bloc/history/operation_event.dart';
import 'package:flutter_bloc_manip/bloc/history_bloc.dart';
import 'package:flutter_bloc_manip/bloc/interface/istate.dart';

class CounterBloc extends Bloc<CounterEvent, IState> {
  int count;
  final HistoryBloc historyBloc;
  final int min = 0;
  final int max = 10;
  String get formattedDate {
    final now = DateTime.now();
    final buffer = StringBuffer()
      ..write('[')
      ..write(now.year)
      ..write('/')
      ..write(now.month.toString().padLeft(2, '0'))
      ..write('/')
      ..write(now.day.toString().padLeft(2, '0'))
      ..write(' ')
      ..write(now.hour.toString().padLeft(2, '0'))
      ..write(':')
      ..write(now.minute.toString().padLeft(2, '0'))
      ..write(':')
      ..write(now.second.toString().padLeft(2, '0'))
      ..write(']');
    return buffer.toString();
  }

  CounterBloc({HistoryBloc? historyBloc})
      : count = 0,
        historyBloc = historyBloc ?? HistoryBloc(),
        super(CounterState(count: 0)) {
    on<IncrementEvent>((event, emit) {
      if (count < max) {
        count += 1;
        emit(CounterState(count: count));
        historyBloc?.add(AddOperationEvent("$formattedDate Incremented to $count"));
      } else {
        emit(OverheadState(message: "The count can't go above $max"));
        historyBloc?.add(AddOperationEvent("$formattedDate Attempted to increment above $max but was prevented"));
      }
    });

    on<DecrementEvent>((event, emit) {
      if (count > min) {
        count -= 1;
        emit(CounterState(count: count));
        historyBloc?.add(AddOperationEvent("$formattedDate Decremented to $count"));
      } else {
        emit(OverheadState(message: "The count can't go below $min"));
        historyBloc?.add(AddOperationEvent("$formattedDate Attempted to decrement below $min but was prevented"));
      }
    });
  }
}
