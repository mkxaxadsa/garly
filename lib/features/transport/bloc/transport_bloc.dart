import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/transport.dart';
import '../service/transport_service.dart';

part 'transport_event.dart';
part 'transport_state.dart';

class TransportBloc extends Bloc<TransportEvent, TransportState> {
  final _service = TransportService();
  List<Transport> _transports = [];

  TransportBloc() : super(TransportInitial()) {
    on<GetTransportsEvent>((event, emit) async {
      if (_service.transports.isEmpty) {
        _transports = await _service.getTransports();
        emit(TransportsLoadedState(transports: _transports));
      } else {
        emit(TransportsLoadedState(transports: _transports));
      }
    });

    on<AddTransportEvent>((event, emit) async {
      _service.transports.add(event.transport);
      _transports = await _service.updateTransports();
      emit(TransportsLoadedState(transports: _transports));
    });

    on<EditTransportEvent>((event, emit) async {
      for (Transport transport in _service.transports) {
        if (transport.id == event.transport.id) {
          transport.type = event.transport.type;
          transport.condition = event.transport.condition;
          transport.price = event.transport.price;
          transport.rentTime = event.transport.rentTime;
          transport.who = event.transport.who;
          transport.comment = event.transport.comment;
          transport.payment = event.transport.payment;
        }
      }
      _transports = await _service.updateTransports();
      emit(TransportsLoadedState(transports: _transports));
    });

    on<DeleteTransportEvent>((event, emit) async {
      _service.transports.removeWhere((element) => element.id == event.id);
      _transports = await _service.updateTransports();
      emit(TransportsLoadedState(transports: _transports));
    });
  }
}
