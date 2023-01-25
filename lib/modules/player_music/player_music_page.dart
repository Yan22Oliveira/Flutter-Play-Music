import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../modules.dart';
import './components/components.dart';

class PlayerMusicPage extends StatefulWidget {

  const PlayerMusicPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerMusicPage> createState() => _PlayerMusicPageState();
}

class _PlayerMusicPageState extends State<PlayerMusicPage> {

  final _cubit = Modular.get<PlayerMusicCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Player'),
      ),
      body: BlocBuilder<PlayerMusicCubit, PlayerMusicState>(
        bloc: _cubit,
        builder: (context, state) {

          if(state is PlayerLoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is PlayerLoadedState){

            return Column(
              children: [
                BuildImageHeader(urlImage: state.music.urlImage!),
                BuildNameMusic(music: state.music),
                const BuildProgressBar(),
                BuildButtons(music: state.music),
              ],
            );

          }else{
            return const  SizedBox();
          }

        },
      ),
    );
  }

}
