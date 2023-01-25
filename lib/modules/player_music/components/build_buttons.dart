import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../models/music_model.dart';
import '../player_music.dart';

class BuildButtons extends StatefulWidget {

  final MusicModel music;
  const BuildButtons({required this.music, Key? key,}) : super(key: key);

  @override
  State<BuildButtons> createState() => _BuildButtonsState();
}

class _BuildButtonsState extends State<BuildButtons> {

  final _cubitProgressBar = Modular.get<ProgressBarCubit>();
  final _cubitPlayerMusic = Modular.get<PlayerMusicCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Row(
        children: [

          TextButton(
            onPressed: (){
              _cubitProgressBar.audioPlayer.pause();
              _cubitProgressBar.setPlaying(false);
              _cubitPlayerMusic.previousMusic();
              _cubitProgressBar.audioPlayer.dispose();
            },
            child: const Icon(
              Icons.fast_rewind,
              size: 56,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () async {
              if (_cubitProgressBar.isPlaying) {
                setState(() {
                  _cubitProgressBar.audioPlayer.pause();
                  _cubitProgressBar.setPlaying(false);
                });
              } else {
                setState(() {
                  _cubitProgressBar.audioPlayer.play(UrlSource(widget.music.url!));
                  _cubitProgressBar.setPlaying(true);
                });
              }
            },
            child: Icon(
              _cubitProgressBar.isPlaying ?
              Icons.pause_circle_outline :
              Icons.play_circle_outline,
              size: 56,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: (){
              _cubitProgressBar.audioPlayer.pause();
              _cubitProgressBar.setPlaying(false);
              _cubitPlayerMusic.nextMusic();
              _cubitProgressBar.audioPlayer.dispose();
            },
            child: const Icon(
              Icons.fast_forward,
              size: 56,
              color: Colors.white,
            ),
          ),

        ],
      ),
    );
  }
}
