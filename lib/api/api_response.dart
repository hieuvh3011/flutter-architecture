class ApiResponse<M, D> {
  final bool success;
  M model;
  final ApiError apiError;
  final D rawData;

  ApiResponse({this.success, this.model, this.rawData, this.apiError});
}

class ApiError {
  final int code;
  final String error;

  ApiError(this.code, this.error);
}
