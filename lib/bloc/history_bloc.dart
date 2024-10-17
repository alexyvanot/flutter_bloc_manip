import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_manip/bloc/history/history_state.dart';
import 'package:flutter_bloc_manip/bloc/history/operation_event.dart';

class HistoryBloc extends Bloc<OperationEvent, HistoryState> {
  HistoryBloc() : super(HistoryState(operations: [])) {
    on<AddOperationEvent>((event, emit) {
      final updatedOperations = List<String>.from(state.operations)
        ..add(event.operation);
      emit(HistoryState(operations: updatedOperations));
    });
  }
}