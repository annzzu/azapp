import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:azapp/repositories/repositories.dart';

part 'images_event.dart';

part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final DatabaseRepository _databaseRepository;
  StreamSubscription? _databaseSubscription;

  ImagesBloc({
    required DatabaseRepository databaseRepository,
  })  : _databaseRepository = databaseRepository,
        super(ImagesLoading()) {
    on<LoadImages>(_mapLoadImagesToState);
    on<UpdateImages>(_mapUpdateImagesToState);
  }

  void _mapLoadImagesToState(
      LoadImages event, Emitter<ImagesState> emit) async {
    _databaseSubscription?.cancel();
    _databaseRepository.getUser().listen(
          (user) => add(
            UpdateImages(user.imageUrls),
          ),
        );
  }

  void _mapUpdateImagesToState(
      UpdateImages event, Emitter<ImagesState> emit) async {
    emit(ImagesLoaded(imageUrls: event.imageUrls));
  }
}
