import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'exceptions.dart';
import 'models.dart';

class SeismicApiClient {
  final http.Client _client;
  final Logger _logger = Logger('SeismicApiClient');

  static const String _authority = 'earthquake.usgs.gov';

  SeismicApiClient(this._client);

  void close() {
    _client.close();
  }

  Future<Earthquake> fetchMetadata(String query) async {
    _logger.info('Initiating connection for earthquake query: $query');

    final feed = switch (query.toLowerCase()) {
      'significant' => 'significant_day',
      '4.5' || 'm4.5' || '4.5+' => '4.5_day',
      '2.5' || 'm2.5' || '2.5+' => '2.5_day',
      '1.0' || 'm1.0' || '1.0+' => '1.0_day',
      'all' || 'global' => 'all_day',
      _ => 'all_day',
    };

    final uri = Uri.https(
      _authority,
      '/earthquakes/feed/v1.0/summary/$feed.geojson',
    );

    try {
      _logger.fine('Sending GET request to: $uri');

      final response = await _client
          .get(uri)
          .timeout(const Duration(seconds: 5));

      _logger.fine('Received HTTP response: ${response.statusCode}');

      if (response.statusCode != 200) {
        _logger.warning(
          'API responded with error status: ${response.statusCode}',
        );

        throw SeismicException(
          'Remote server rejected transaction '
          '(HTTP ${response.statusCode}).',
        );
      }

      final decoded = json.decode(response.body);

      if (decoded is! Map<String, dynamic>) {
        throw SeismicException('Unexpected JSON response payload structure.');
      }

      final features = decoded['features'];

      if (features is! List || features.isEmpty) {
        throw SeismicException('USGS returned no earthquake records.');
      }

      final firstFeature = features.first;

      if (firstFeature is! Map<String, dynamic>) {
        throw SeismicException('Unexpected earthquake feature structure.');
      }

      return Earthquake.fromJson(firstFeature);
    } on http.ClientException catch (e) {
      _logger.severe('Network socket transaction failed.', e);

      throw SeismicException('Network communication failure occurred.', e);
    } catch (e) {
      _logger.severe('An unexpected processing failure was intercepted.', e);

      rethrow;
    } finally {
      _logger.fine('Earthquake API request lifecycle completed.');
    }
  }

  Future<List<Earthquake>> fetchAlerts() async {
    _logger.info('Initiating high-magnitude seismic alert request.');

    final uri = Uri.https(_authority, '/fdsnws/event/1/query', {
      'format': 'geojson',
      'starttime': 'now-1day',
      'minmagnitude': '6',
      'orderby': 'magnitude',
      'limit': '10',
    });

    try {
      _logger.fine('Sending alert GET request to: $uri');

      final response = await _client
          .get(uri)
          .timeout(const Duration(seconds: 5));

      _logger.fine('Received alert HTTP response: ${response.statusCode}');

      if (response.statusCode != 200) {
        _logger.warning(
          'Alert API responded with error status: '
          '${response.statusCode}',
        );

        throw SeismicException(
          'Alert server rejected transaction '
          '(HTTP ${response.statusCode}).',
        );
      }

      final decoded = json.decode(response.body);

      if (decoded is! Map<String, dynamic>) {
        throw SeismicException('Unexpected alert payload structure.');
      }

      final features = decoded['features'];

      if (features is! List) {
        throw SeismicException('Alert payload contains no feature collection.');
      }

      return [
        for (final feature in features)
          if (feature is Map<String, dynamic>) Earthquake.fromJson(feature),
      ];
    } on http.ClientException catch (e) {
      _logger.severe('Alert network transaction failed.', e);

      throw SeismicException('Network communication failure occurred.', e);
    } catch (e) {
      _logger.severe('Unexpected alert processing failure.', e);

      rethrow;
    } finally {
      _logger.fine('Earthquake alert request lifecycle completed.');
    }
  }
}
