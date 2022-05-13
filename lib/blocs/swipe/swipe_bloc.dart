import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:azapp/models/models/models.dart';

import '../../models/user_model.dart';

part 'swipe_event.dart';

part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading()) {
    on<LoadUsersEvent>((event, emit) => _mapLoadUsersToState(event, emit));
    on<SwipeLeftEvent>(
        (event, emit) => _mapSwipeLeftEventToState(event, state, emit));
    on<SwipeRightEvent>(
        (event, emit) => _mapSwipeRightEventToState(event, state, emit));
  }

  void _mapLoadUsersToState(
      LoadUsersEvent event, Emitter<SwipeState> emit) async {
    emit(SwipeLoaded(users: event.users));
  }

  void _mapSwipeLeftEventToState(
      SwipeLeftEvent event, SwipeState state, Emitter<SwipeState> emit) async {
    if (state is SwipeLoaded) {
      try {
        emit(SwipeLoaded(users: List.from(state.users)..remove(event.user)));
      } catch (_) {}
    }
  }

  void _mapSwipeRightEventToState(
      SwipeRightEvent event, SwipeState state, Emitter<SwipeState> emit) async {
    if (state is SwipeLoaded) {
      try {
        emit(SwipeLoaded(users: List.from(state.users)..remove(event.user)));
      } catch (_) {}
    }
  }
}
