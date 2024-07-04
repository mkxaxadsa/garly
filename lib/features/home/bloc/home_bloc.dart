import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:in_app_review/in_app_review.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<ChangePageEvent>((event, emit) {
      if (event.index == 0) {
        if (state is HomeInitial) return;
        emit(HomeInitial());
      } else if (event.index == 1) {
        if (state is HomeNews) return;
        emit(HomeNews());
      } else {
        if (state is HomeSettings) return;
        emit(HomeSettings());
      }
    });
  }
}
