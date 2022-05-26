import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:azapp/models/models.dart';

import '../../models/models/user_model.dart';
import '../../repositories/repositories.dart';
import '../auth/auth_bloc.dart';

part 'swipe_event.dart';

part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final AuthBloc _authBloc;
  final DatabaseRepository _databaseRepository;
  StreamSubscription? _authSubscription;

  SwipeBloc({
    required AuthBloc authBloc,
    required DatabaseRepository databaseRepository,
  })  : _authBloc = authBloc,
        _databaseRepository = databaseRepository,
        super(SwipeLoading()) {
    on<LoadUsers>(_onLoadUsers);
    on<UpdateHome>(_onUpdateHome);
    on<SwipeLeft>(_onSwipeLeftEvent);
    on<SwipeRight>(_onSwipeRightEvent);
    _authSubscription = _authBloc.stream.listen((state) {
      if (state.status == AuthStatus.authenticated) {
        add(LoadUsers(userId: state.user!.uid));
      }
    });
  }

  void _onLoadUsers(LoadUsers event, Emitter<SwipeState> emit)  {
    _databaseRepository.getUsers(event.userId, 'Male').listen((users) {
      print('$users');
      add(
        UpdateHome(users: users),
      );
    });
  }

  void _onUpdateHome(
      UpdateHome event,
      Emitter<SwipeState> emit,
      ) {
    if (event.users != null) {
      emit(SwipeLoaded(users: event.users!));
    } else {
      emit(SwipeError());
    }
  }

  void _onSwipeLeftEvent(SwipeLeft event, Emitter<SwipeState> emit) async {
    if (state is SwipeLoaded) {
      final state = this.state as SwipeLoaded;
      try {
        emit(SwipeLoaded(users: List.from(state.users)..remove(event.user)));
      } catch (_) {}
    }
  }

  void _onSwipeRightEvent(
      SwipeRight event, Emitter<SwipeState> emit) async {
    if (state is SwipeLoaded) {
      final state = this.state as SwipeLoaded;
      try {
        emit(SwipeLoaded(users: List.from(state.users)..remove(event.user)));
      } catch (_) {}
    }
  }
}
