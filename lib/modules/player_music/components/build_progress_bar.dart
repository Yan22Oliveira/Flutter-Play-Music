import 'package:flutter/material.dart';

class BuildProgressBar extends StatelessWidget {

  const BuildProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32,),
      child: Column(
        children: [
          const LinearProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            value: 0.5,
          ),
          const SizedBox(height: 8,),
          Row(
            children: const [
              Text('1:00'),
              Spacer(),
              Text('2:00'),
            ],
          )
        ],
      ),
    );

  }
}
