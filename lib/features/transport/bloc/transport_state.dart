part of 'transport_bloc.dart';

abstract class TransportState {}

class TransportInitial extends TransportState {}

class TransportsLoadedState extends TransportState {
  final List<Transport> transports;
  TransportsLoadedState({required this.transports});
}
