import 'package:flutter_bloc_manip/bloc/istate.dart';

class CounterState implements IState {
  final int count;
  CounterState({ required this.count });
}