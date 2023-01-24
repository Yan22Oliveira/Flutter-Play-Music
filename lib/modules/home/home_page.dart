import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../models/models.dart';
import '../../shared/shared.dart';
import './home_controller.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Play List'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index){
          return ListTile(
            onTap: () => _controller.onPagePlayeMusic(music,),
            title: Text(
              music.title,
              style: AppTextStyles.textTitle,
            ),
            subtitle: Text(
              music.subTitle,
              style: AppTextStyles.textSubTitle,
            ),
            leading: Image.network(music.urlImage),
            contentPadding: const EdgeInsets.all(8),
          );
        },
      ),
    );
  }

  var music = MusicModel(
    title: 'Duas horas de louvores - Volume 1',
    subTitle: 'Igreja Cristã Maranata',
    url: '',
    urlImage: 'https://i.ytimg.com/vi/3A_lVehtg14/maxresdefault.jpg',
  );

}
