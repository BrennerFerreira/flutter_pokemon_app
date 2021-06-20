class ApiResponse<T> {
  final bool success;
  final T payload;

  ApiResponse({required this.success, required this.payload});
}
