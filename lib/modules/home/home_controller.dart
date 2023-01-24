import 'package:flutter_modular/flutter_modular.dart';

import '../../models/models.dart';

class HomeController {

  void onPagePlayeMusic(MusicModel music) => Modular.to.pushNamed(
    '/player_music/',
    arguments: music,
  );

}