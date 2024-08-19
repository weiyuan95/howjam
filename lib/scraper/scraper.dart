import 'package:chaleno/chaleno.dart';

enum CheckpointLocation { woodlands, tuas, secondlink }

class Scraper {
  Future<List<String>> scrape(CheckpointLocation location) async {
    // Both locations have the same URL, but the image position is different
    const singaporeTrafficImageUrl =
        'https://onemotoring.lta.gov.sg/content/onemotoring/home/driving/traffic_information/traffic-cameras/woodlands.html';

    // Scrape Singapore traffic images
    var parser = await Chaleno().load(singaporeTrafficImageUrl);
    var imageUrls = parser
            ?.querySelector('.road-snapshots')
            .querySelectorAll('img')
            ?.map((e) => e.src)
            .toList() ??
        [] as List<String>;

    // Let clients handle error scenarios, we will return an empty list
    // There should be 4 images on `trafficImageUrl`, and they should be non-null
    if (imageUrls.length != 4) {
      return [];
    }

    if (imageUrls.any((element) => element == null)) {
      return [];
    }

    var validatedImageUrls =
        List<String>.from(imageUrls).map((e) => 'https:$e').toList();

    if (location == CheckpointLocation.tuas) {
      return validatedImageUrls.sublist(0, 2);
    }

    if (location == CheckpointLocation.woodlands) {
      return validatedImageUrls.sublist(2);
    }

    // Fallthrough scenario - clients should handle empty list
    return [] as List<String>;
  }
}
