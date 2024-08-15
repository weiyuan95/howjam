import 'package:flutter_test/flutter_test.dart';
import 'package:howjam/scraper/scraper.dart';

void main() {
  group('Scraper Test', () {
    test('Scrape Woodlands', () async {
      var scraper = Scraper();
      // Location passed in doesn't matter for now
      var images = await scraper.scrape(CheckpointLocation.woodlands);
      expect(images.length, 2);
      for (var element in images) {
        expect(element, startsWith("https://"));
      }
    });

    test('Scrape Tuas', () async {
      var scraper = Scraper();
      // Location passed in doesn't matter for now
      var images = await scraper.scrape(CheckpointLocation.tuas);
      expect(images.length, 2);
      for (var element in images) {
        expect(element, startsWith("https://"));
      }
    });
  });
}
