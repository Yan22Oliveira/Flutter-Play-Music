import 'package:flutter/material.dart';

class BuildImageHeader extends StatelessWidget {

  final String urlImage;
  const BuildImageHeader({required this.urlImage, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Container(
        width: width,
        height: 350,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(urlImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade700,
              blurRadius: 12,
            ),
          ],
        ),
      ),
    );
  }
}
