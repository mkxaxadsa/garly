part of 'transport_bloc.dart';

abstract class TransportEvent {}

class GetTransportsEvent extends TransportEvent {}

class AddTransportEvent extends TransportEvent {
  final Transport transport;
  AddTransportEvent({required this.transport});
}

class EditTransportEvent extends TransportEvent {
  final Transport transport;
  EditTransportEvent({required this.transport});
}

class DeleteTransportEvent extends TransportEvent {
  final int id;
  DeleteTransportEvent({required this.id});
}
