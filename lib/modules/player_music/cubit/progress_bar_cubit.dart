import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './progress_bar_state.dart';

class ProgressBarCubit extends Cubit<ProgressBarState>  {

  ProgressBarCubit() : super(ProgressBarInitialState()){
    onPlayerStateChanged();
    onDurationChanged();
    onPositionChanged();
  }

  final audioPlayer = AudioPlayer();

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  void setPlaying(bool value){
    isPlaying = value;
    emit(ProgressBarLoadingState());
    emit(ProgressBarLoadedState(duration, position));
  }

  void onPlayerStateChanged() {
    emit(ProgressBarLoadingState());
    audioPlayer.onPlayerStateChanged.listen((state)=>_setState(state));
  }

  void _setState(dynamic state) {
    isPlaying = state == PlayerState.playing;
    emit(ProgressBarLoadingState());
    emit(ProgressBarLoadedState(duration, position));
  }

  void onDurationChanged() {
    emit(ProgressBarLoadingState());
    audioPlayer.onDurationChanged.listen((newDuration)=>_setDuration(newDuration));
  }

  void _setDuration(dynamic newDuration) {
    duration = newDuration;
    emit(ProgressBarLoadingState());
    emit(ProgressBarLoadedState(duration, position));
  }

  void onPositionChanged() {
    emit(ProgressBarLoadingState());
    audioPlayer.onPositionChanged.listen((newPosition)=>_setPosition(newPosition));
  }

  void _setPosition(dynamic newPosition) {
    position = newPosition;
    emit(ProgressBarLoadingState());
    emit(ProgressBarLoadedState(duration, position));
  }

}