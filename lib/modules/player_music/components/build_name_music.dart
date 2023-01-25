import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../shared/shared.dart';

class BuildNameMusic extends StatelessWidget {

  final MusicModel music;
  const BuildNameMusic({required this.music, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            music.title!,
            textAlign: TextAlign.center,
            style: AppTextStyles.textTitleLarge,
          ),
          Text(
            music.subTitle!,
            style: AppTextStyles.textSubTitle,
          ),
        ],
      ),
    );
  }

}
