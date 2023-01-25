import 'package:flutter_modular/flutter_modular.dart';

import './home_page.dart';
import './cubit/cubit.dart';
import './services/services.dart';

class HomeModule extends Module {

  @override
  List<Bind> binds = [
    Bind.singleton<IHomeService>((i) => HomeService()),
    Bind.singleton<HomeCubit>((i) => HomeCubit(i(),i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const HomePage(),
    ),
  ];

}