part of 'first_card_bloc.dart';

abstract class FirstCardState {}

class FirstCardInitial extends FirstCardState {}

class FirstCardSelected extends FirstCardState {
  final String type;
  final String count;
  final String condition;
  FirstCardSelected({
    required this.type,
    required this.count,
    required this.condition,
  });
}
