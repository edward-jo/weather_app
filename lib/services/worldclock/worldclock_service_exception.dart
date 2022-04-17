class WorldClockServiceException implements Exception {
  WorldClockServiceException(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}
