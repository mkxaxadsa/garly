part of 'first_card_bloc.dart';

abstract class FirstCardEvent {}

class SelectTypeEvent extends FirstCardEvent {
  final String type;
  SelectTypeEvent({required this.type});
}

class SelectCountEvent extends FirstCardEvent {
  final String count;
  SelectCountEvent({required this.count});
}

class SelectConditionEvent extends FirstCardEvent {
  final String condition;
  SelectConditionEvent({required this.condition});
}
