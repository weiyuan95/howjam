import 'package:flutter/material.dart';

class CheckpointImage extends StatelessWidget {
  const CheckpointImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: FadeInImage.assetNetwork(
            fadeInCurve: Curves.ease,
            placeholder: 'assets/images/loading.png',
            image: url,
          ),
        ),
      ],
    );
  }
}
