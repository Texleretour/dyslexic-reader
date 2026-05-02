class PermissionsNotGrantedException implements Exception {
  String cause;
  PermissionsNotGrantedException(this.cause);
}