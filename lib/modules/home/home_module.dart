import 'package:flutter_modular/flutter_modular.dart';

import './home_page.dart';
import './home_controller.dart';

class HomeModule extends Module {

  @override
  List<Bind> binds = [
    Bind.singleton<HomeController>((i) => HomeController()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const HomePage(),
    ),
  ];
}