import 'package:test/test.dart';
import 'package:seismic_api/seismic_api.dart';

void main() {
  test('Seismic API library is accessible', () {
    expect(Earthquake, isNotNull);
    expect(SeismicApiClient, isNotNull);
    expect(SeismicException, isNotNull);
  });
}
