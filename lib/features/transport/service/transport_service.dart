import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/models/transport.dart';

class TransportService {
  List<Transport> transports = [];

  Future<List<Transport>> getTransports() async {
    final box = await Hive.openBox('transportbox');
    List transports2 = box.get('transports') ?? [];
    transports = transports2.cast<Transport>();
    log(transports.length.toString());
    return transports;
  }

  Future<List<Transport>> updateTransports() async {
    final box = await Hive.openBox('transportbox');
    box.put('transports', transports);
    transports = await box.get('transports');
    return transports;
  }
}
