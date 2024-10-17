import 'package:flutter_bloc_manip/bloc/interface/istate.dart';

class OverheadState implements IState {
  final String message;
  OverheadState({ required this.message });
}