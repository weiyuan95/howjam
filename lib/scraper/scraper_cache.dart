import 'package:howjam/scraper/scraper.dart';

class ScrapeCacheItem {
  final List<String> imageUrls;
  final DateTime lastUpdated;

  const ScrapeCacheItem(this.imageUrls, this.lastUpdated);
}

ScraperCache scraperStore = ScraperCache(const Duration(seconds: 5));

class ScraperCache {
  final Map<CheckpointLocation, ScrapeCacheItem> _cache = {};
  final Duration _ttl;

  /// Supports up to microsecond TTLs, although you should be using milliseconds instead
  ScraperCache(this._ttl);

  Future<ScrapeCacheItem> get(CheckpointLocation key) async {
    var scraper = Scraper();

    if (!_cache.containsKey(key)) {
      // Finish the scrape _first_
      var scraped = await scraper.scrape(key);
      // Then set the time
      _cache[key] = ScrapeCacheItem(scraped, DateTime.now());
    }

    var val = _cache[key];
    var currentTime = DateTime.now();

    // Should never hit this case
    if (val == null) {
      throw Exception('Unexpected cache miss for $key');
    }

    // If the TTL has expired, refresh the cached value
    if (currentTime.difference(val.lastUpdated).inMicroseconds >
        _ttl.inMicroseconds) {
      var scraped = await scraper.scrape(key);
      _cache[key] = ScrapeCacheItem(scraped, DateTime.now());
      val = _cache[key];

      // Should never hit this case
      if (val == null) {
        throw Exception('Unexpected cache miss for $key');
      }
    }

    return val;
  }

// Note: no need for a `set` since we should always only call `get`, if needed,
// it will re-fetch the data
}
