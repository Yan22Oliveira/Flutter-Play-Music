import 'package:equatable/equatable.dart';

abstract class ProgressBarState extends Equatable {}

class ProgressBarInitialState extends ProgressBarState {
  @override
  List<Object> get props => [];
}

class ProgressBarLoadingState extends ProgressBarState {
  @override
  List<Object> get props => [];
}

class ProgressBarLoadedState extends ProgressBarState {

  final Duration duration;
  final Duration position;
  ProgressBarLoadedState(this.duration, this.position);

  @override
  List<Object> get props => [duration,position];
}
