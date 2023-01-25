import 'package:flutter_modular/flutter_modular.dart';

import './player_music_page.dart';


class PlayerMusicModule extends Module {

  @override
  List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const PlayerMusicPage(),
    ),
  ];
}