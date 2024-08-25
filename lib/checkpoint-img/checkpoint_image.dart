import 'package:flutter/material.dart';
import 'package:howjam/scraper/scraper.dart';

class CheckpointImage extends StatelessWidget {
  const CheckpointImage({super.key, required this.url, required this.location});

  final String url;
  final CheckpointLocation location;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
            height: location == CheckpointLocation.secondlink ? 250 : null,
            width: double.infinity,
            child: FadeInImage(
              fit: BoxFit.fitWidth,
              fadeInCurve: Curves.ease,
              placeholder: const AssetImage("assets/images/loading.jpg"),
              image: NetworkImage(url),
            )),
      ],
    );
  }
}
