import 'package:flutter/material.dart';

import '../../models/models.dart';
import './components/components.dart';

class PlayerMusicPage extends StatelessWidget {

  final MusicModel music;
  const PlayerMusicPage({
    required this.music,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text('Tocando a Musica ${music.title}'),
      ),
      body: Column(
        children: [
          BuildImageHeader(urlImage: music.urlImage),
          const BuildNameMusic(),
          const BuildProgressBar(),
          const BuildButtons(),
        ],
      ),
    );
  }
}
