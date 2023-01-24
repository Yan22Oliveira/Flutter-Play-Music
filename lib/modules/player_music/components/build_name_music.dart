import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class BuildNameMusic extends StatelessWidget {

  const BuildNameMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            'Duas horas de louvores - Volume 1',
            textAlign: TextAlign.center,
            style: AppTextStyles.textTitleLarge,
          ),
          Text(
            'Igreja Cristã Maranata',
            style: AppTextStyles.textSubTitle,
          ),
        ],
      ),
    );
  }

}
