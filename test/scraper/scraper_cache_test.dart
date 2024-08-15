import 'package:flutter_test/flutter_test.dart';
import 'package:howjam/scraper/scraper.dart';
import 'package:howjam/scraper/scraper_cache.dart';

void main() {
  group('ScraperCache Test', () {
    test('Cache TTL correctly expires existing value', () async {
      var scraperCache = ScraperCache(const Duration(milliseconds: 2000));

      final original = await scraperCache.get(CheckpointLocation.woodlands);
      await Future.delayed(const Duration(milliseconds: 3000));

      final updated = await scraperCache.get(CheckpointLocation.woodlands);

      expect(identical(original, updated), false);
    });

    test('Cache correctly reuses existing value', () async {
      var scraperCache = ScraperCache(const Duration(milliseconds: 2000));

      final original = await scraperCache.get(CheckpointLocation.woodlands);
      await Future.delayed(const Duration(milliseconds: 1000));

      final updated = await scraperCache.get(CheckpointLocation.woodlands);

      expect(identical(original, updated), true);
    });
  });
}
