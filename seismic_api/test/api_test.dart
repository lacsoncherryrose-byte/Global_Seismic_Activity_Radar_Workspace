import 'package:test/test.dart';
import 'package:seismic_api/seismic_api.dart';

void main() {
  group('Model Deserialisation Suite', () {
    test('Successful parsing of structural attributes', () {
      final mockJson = {
        'id': 'ID-1001',
        'properties': {'place': 'Test Earthquake', 'mag': 5.5},
      };

      final earthquake = Earthquake.fromJson(mockJson);

      expect(earthquake.id, equals('ID-1001'));
      expect(earthquake.place, equals('Test Earthquake'));
      expect(earthquake.magnitude, equals(5.5));
    });

    test('Trigger custom exception on broken mapping keys', () {
      final malformedJson = {
        'id': 'ID-1002',
        // Missing properties.place and properties.mag
      };

      expect(
        () => Earthquake.fromJson(malformedJson),
        throwsA(isA<SeismicException>()),
      );
    });
  });
}
