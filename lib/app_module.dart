import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './modules/modules.dart';

class AppModule extends Module {

  @override
  List<Bind> get binds => [
    Bind.factory((i) => Dio()),
    Bind.singleton<PlayerMusicCubit>((i) => PlayerMusicCubit()),
    Bind.singleton<ProgressBarCubit>((i) => ProgressBarCubit()),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(
      Modular.initialRoute,
      module: HomeModule(),
    ),
    ModuleRoute(
      '/player_music',
      module: PlayerMusicModule(),
    ),
  ];

}
