import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'first_card_event.dart';
part 'first_card_state.dart';

class FirstCardBloc extends Bloc<FirstCardEvent, FirstCardState> {
  String type = '';
  String count = '';
  String condition = '';

  FirstCardBloc() : super(FirstCardInitial()) {
    on<SelectTypeEvent>((event, emit) {
      log(event.type);
      type = event.type;
      emit(FirstCardSelected(
        type: type,
        count: count,
        condition: condition,
      ));
    });

    on<SelectCountEvent>((event, emit) {
      count = event.count;
      emit(FirstCardSelected(
        type: type,
        count: count,
        condition: condition,
      ));
    });

    on<SelectConditionEvent>((event, emit) {
      condition = event.condition;
      emit(FirstCardSelected(
        type: type,
        count: count,
        condition: condition,
      ));
    });
  }
}
