import 'package:flutter_bloc_manip/bloc/istate.dart';

abstract class CounterEvent extends IState {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}