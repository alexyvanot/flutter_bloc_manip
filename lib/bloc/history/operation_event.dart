abstract class OperationEvent {}

class AddOperationEvent extends OperationEvent {
  final String operation;
  AddOperationEvent(this.operation);
}