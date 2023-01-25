import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/shared.dart';
import './cubit/cubit.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _cubit = Modular.get<HomeCubit>();

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Play List'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _cubit,
        builder: (context, state) {

          if(state is LoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is LoadedState){

            var list = state.listMusic;

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => _cubit.onPagePlayeMusic(list,index),
                  title: Text(
                    list[index].title!,
                    style: AppTextStyles.textTitle,
                  ),
                  subtitle: Text(
                    list[index].subTitle!,
                    style: AppTextStyles.textSubTitle,
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Image.network(
                      list[index].urlImage!,
                      height: 88,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(8),
                );
              },
            );

          } else if(state is ErrorState) {

            return const Center(
              child: Icon(
                Icons.error_outline,
                size: 40,
                color: Colors.red,
              ),
            );

          } else {
            return const SizedBox();
          }

        },
      ),
    );
  }

}
