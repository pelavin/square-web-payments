import 'dart:js_interop';

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

extension type JSError._(JSObject _) implements JSObject {
  external String get name;
  external String get message;
  external String? get stack;
  Error get toDart => Error(name: name, message: message, stack: stack);
}
