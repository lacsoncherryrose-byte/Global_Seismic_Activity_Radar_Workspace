import 'exceptions.dart';

class Earthquake {
  final String id;
  final String place;
  final double magnitude;

  const Earthquake({
    required this.id,
    required this.place,
    required this.magnitude,
  });

  factory Earthquake.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String parsedId,
        'properties': {'place': String parsedPlace, 'mag': num parsedMagnitude},
      } =>
        Earthquake(
          id: parsedId,
          place: parsedPlace,
          magnitude: parsedMagnitude.toDouble(),
        ),

      _ => throw SeismicException('Payload failed pattern validation check!'),
    };
  }
}
