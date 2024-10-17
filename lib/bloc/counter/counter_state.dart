import 'package:flutter_bloc_manip/bloc/interface/istate.dart';

class CounterState implements IState {
  final int count;
  CounterState({ required this.count });
}