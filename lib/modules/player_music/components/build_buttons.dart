import 'package:flutter/material.dart';

class BuildButtons extends StatelessWidget {
  const BuildButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [

          TextButton(
            onPressed: (){},
            child: const Icon(
              Icons.fast_rewind,
              size: 56,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: (){},
            child: const Icon(
              Icons.play_circle_outline,
              size: 56,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: (){},
            child: const Icon(
              Icons.fast_forward,
              size: 56,
              color: Colors.white,
            ),
          ),

        ],
      ),
    );
  }
}
