import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/shared.dart';
import '../cubit/cubit.dart';

class BuildProgressBar extends StatefulWidget {

  const BuildProgressBar({Key? key}) : super(key: key);

  @override
  State<BuildProgressBar> createState() => _BuildProgressBarState();
}

class _BuildProgressBarState extends State<BuildProgressBar> {

  final _cubit = Modular.get<ProgressBarCubit>();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProgressBarCubit, ProgressBarState>(
      bloc: _cubit,
      builder: (context, state) {

        if(state is ProgressBarLoadingState){

          return Column(
            children: [
              const Slider(
                min: 0,
                max: 0,
                value: 0,
                activeColor: Colors.blueAccent,
                inactiveColor: Colors.grey,
                onChanged: null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: const [
                    Text('00:00'),
                    Spacer(),
                    Text('00:00'),
                  ],
                ),
              )
            ],
          );

        }else if (state is ProgressBarLoadedState){
          return Column(
            children: [
              Slider(
                min: 0,
                max: state.duration.inSeconds.toDouble(),
                value: _cubit.position.inSeconds.toDouble(),
                activeColor: Colors.blueAccent,
                inactiveColor: Colors.grey,
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await _cubit.audioPlayer.seek(position);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(formatTime(state.position)),
                    const Spacer(),
                    Text(formatTime(state.duration - state.position)),
                  ],
                ),
              )
            ],
          );
        }else{
          return const SizedBox();
        }

      },
    );
  }

}
