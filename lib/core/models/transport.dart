import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Transport {
  @HiveField(0)
  int id;
  @HiveField(1)
  String type;
  @HiveField(2)
  String price;
  @HiveField(3)
  String who;
  @HiveField(4)
  String payment;
  @HiveField(5)
  String rentTime;
  //
  @HiveField(6)
  String comment;
  @HiveField(7)
  String condition;

  Transport({
    required this.id,
    required this.type,
    required this.price,
    required this.who,
    required this.payment,
    required this.rentTime,
    //
    required this.comment,
    required this.condition,
  });
}

class TransportAdapter extends TypeAdapter<Transport> {
  @override
  final typeId = 0;

  @override
  Transport read(BinaryReader reader) {
    return Transport(
      id: reader.read(),
      type: reader.read(),
      price: reader.read(),
      who: reader.read(),
      payment: reader.read(),
      rentTime: reader.read(),
      //
      comment: reader.read(),
      condition: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Transport obj) {
    writer.write(obj.id);
    writer.write(obj.type);
    writer.write(obj.price);
    writer.write(obj.who);
    writer.write(obj.payment);
    writer.write(obj.rentTime);
    //
    writer.write(obj.comment);
    writer.write(obj.condition);
  }
}
