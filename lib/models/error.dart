class Error{
  final String timestamp;
  final int status;
  final String error;
  final String message;
  final String path;

  Error({
    this.timestamp,
    this.status,
    this.error,
    this.message,
    this.path
  });

  factory Error.fromJSON(Map<String,dynamic> json) => Error(
      timestamp: json['timestamp'] as String,
      status: json['status'] as int,
      error: json['error'] as String,
      message: json['message'] as String,
      path: json['path'] as String
  );

}