class AppDatabaseException implements Exception {

  final String message;

  AppDatabaseException(this.message);

  @override
  String toString() => message;
}



