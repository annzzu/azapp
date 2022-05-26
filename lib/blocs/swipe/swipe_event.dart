part of 'swipe_bloc.dart';

abstract class SwipeEvent extends Equatable {
  const SwipeEvent();

  @override
  List<Object?> get props => [];
}

class LoadUsers extends SwipeEvent {
  final String userId;

  const LoadUsers({
    required this.userId,
  });

  @override
  List<Object?> get props => [userId];
}

class UpdateHome extends SwipeEvent {
  final List<User>? users;

  const UpdateHome({
    required this.users,
  });

  @override
  List<Object?> get props => [users];
}

class SwipeLeft extends SwipeEvent {
  final User user;

  const SwipeLeft({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class SwipeRight extends SwipeEvent {
  final User user;

  const SwipeRight({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}
