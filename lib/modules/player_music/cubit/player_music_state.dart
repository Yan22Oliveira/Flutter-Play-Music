import 'package:equatable/equatable.dart';

import '../../../models/models.dart';

abstract class PlayerMusicState extends Equatable {}

class PlayerInitialState extends PlayerMusicState {
  @override
  List<Object> get props => [];
}

class PlayerLoadingState extends PlayerMusicState {
  @override
  List<Object> get props => [];
}

class PlayerLoadedState extends PlayerMusicState {

  final MusicModel music;
  PlayerLoadedState(this.music);

  @override
  List<Object> get props => [music];
}