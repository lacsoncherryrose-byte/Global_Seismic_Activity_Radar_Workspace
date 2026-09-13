class SeismicException implements Exception {
  final String message;
  final Object? cause;

  SeismicException(this.message, [this.cause]);

  @override
  String toString() {
    if (cause != null) {
      return 'SeismicException: $message (Underlying: $cause)';
    }

    return 'SeismicException: $message';
  }
}
