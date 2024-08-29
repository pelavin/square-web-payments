/// https://developer.squareup.com/reference/sdks/web/payments/errors
class Error {
  final String name;
  final String message;
  final String? stack;

  const Error({required this.name, required this.message, required this.stack});

  Map<String, dynamic> toJson() => {
        'name': name,
        'message': message,
        ...(stack == null ? {} : {'stack': stack})
      };
}
