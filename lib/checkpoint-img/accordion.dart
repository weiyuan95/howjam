import 'package:flutter/material.dart';
import 'package:howjam/checkpoint-img/checkpoint_image.dart';
import 'package:howjam/scraper/scraper.dart';
import 'package:howjam/scraper/scraper_cache.dart';

class CheckpointAccordion extends StatefulWidget {
  const CheckpointAccordion({
    super.key,
  });

  @override
  State<CheckpointAccordion> createState() => _CheckpointAccordionState();
}

class _CheckpointAccordionState extends State<CheckpointAccordion> {
  final Future<Map<CheckpointLocation, ScrapeCacheItem>> _images = Future.wait([
    scraperStore.get(CheckpointLocation.tuas),
    scraperStore.get(CheckpointLocation.woodlands),
  ]).then((futures) => {
        CheckpointLocation.tuas: futures[0],
        CheckpointLocation.woodlands: futures[1],
      });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _images,
        builder: (context, snapshot) {
          return createAccordion(context, snapshot);
        });
  }
}

Widget createAccordion(BuildContext context,
    AsyncSnapshot<Map<CheckpointLocation, ScrapeCacheItem>> snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          (MediaQuery.of(context).padding.top +
              kToolbarHeight +
              kBottomNavigationBarHeight),
      width: MediaQuery.of(context).size.width,
      child: const SizedBox(
          width: 40,
          height: 40,
          child: Center(child: CircularProgressIndicator())),
    );
  }

  if (snapshot.hasError) {
    // TODO: consider error image?
    return Text("Error: ${snapshot.error}");
  }

  if (snapshot.hasData) {
    final woodlandsCachedItem = snapshot.data?[CheckpointLocation.woodlands];
    final tuasCachedItem = snapshot.data?[CheckpointLocation.tuas];

    // TODO: consider error image?
    if (woodlandsCachedItem == null || tuasCachedItem == null) {
      return const Text("Unknown error");
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      ExpansionTile(
        title: const Text("Woodlands Checkpoint"),
        children: [
          const Text("Johor–Singapore Causeway"),
          CheckpointImage(
            url: woodlandsCachedItem.imageUrls[0],
          ),
          const Text("Woodlands Checkpoint"),
          CheckpointImage(
            url: woodlandsCachedItem.imageUrls[1],
          ),
        ],
      ),
      ExpansionTile(
        title: const Text("Tuas Checkpoint"),
        children: [
          const Text("Second Link"),
          CheckpointImage(
            url: tuasCachedItem.imageUrls[0],
          ),
          const Text("Tuas Checkpoint"),
          CheckpointImage(
            url: tuasCachedItem.imageUrls[1],
          ),
        ],
      )
    ]);
  }

  // TODO: consider error image?
  return const Text("Unknown error");
}
