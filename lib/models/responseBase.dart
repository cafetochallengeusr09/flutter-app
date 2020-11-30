class ResponseBase<T> {
  final int code;
  final String message;
  final T body;

  ResponseBase({this.code, this.message, this.body});

  factory ResponseBase.fromJson(Map<String, dynamic> json) {
    return ResponseBase(
      code: json['code'],
      message: json['message'],
      body: json['body'],
    );
  }
}
