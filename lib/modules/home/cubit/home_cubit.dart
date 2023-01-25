import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../models/models.dart';
import '../../player_music/player_music.dart';
import '../home.dart';
import './home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  final IHomeService _service;
  final PlayerMusicCubit _playerMusicCubit;
  HomeCubit(this._service,this._playerMusicCubit) : super(InitialState()) {
    _getListMusic();
  }

  Future<void> _getListMusic() async {
    emit(LoadingState());
    var result = await _service.getListMusic();
    result.fold(
      (exception) => emit(ErrorState()),
      (clubeBKModel) => emit(LoadedState(clubeBKModel)),
    );
  }

  void onPagePlayeMusic(List<MusicModel> listMusic, int index){
    _sendPlayeMusicController(listMusic,index);
    Modular.to.pushNamed('/player_music/',);
  }

  void _sendPlayeMusicController(List<MusicModel> listMusic, int index){
    _playerMusicCubit.listMusic = listMusic;
    _playerMusicCubit.index = index;
    _playerMusicCubit.setMusicCurrent(listMusic[index]);
  }

}