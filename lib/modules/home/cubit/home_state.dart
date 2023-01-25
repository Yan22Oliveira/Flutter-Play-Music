import 'package:equatable/equatable.dart';

import '../../../models/models.dart';

abstract class HomeState extends Equatable {}

class InitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadedState extends HomeState {

  final List<MusicModel> listMusic;
  LoadedState(this.listMusic);

  @override
  List<Object> get props => [listMusic];
}

class ErrorState extends HomeState {
  @override
  List<Object> get props => [];
}
