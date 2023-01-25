import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import './player_music_state.dart';

class PlayerMusicCubit extends Cubit<PlayerMusicState>  {

  PlayerMusicCubit() : super(PlayerInitialState());

  List<MusicModel> listMusic = [];
  int index = 0;

  late MusicModel musicCurrent;

  setMusicCurrent(music){
    emit(PlayerLoadingState());
    musicCurrent = music;
    emit(PlayerLoadedState(musicCurrent));
  }

  void nextMusic(){
    emit(PlayerLoadingState());
    if(index == listMusic.length -1){
      index = 0;
    }else{
      index++;
    }
    musicCurrent = listMusic[index];
    emit(PlayerLoadedState(musicCurrent));
  }

  previousMusic(){
    emit(PlayerLoadingState());
    if(index == 0){
      index = (listMusic.length -1);
    }else{
      index--;
    }
    musicCurrent = listMusic[index];
    emit(PlayerLoadedState(musicCurrent));
  }

}