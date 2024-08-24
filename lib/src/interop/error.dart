import 'dart:js_interop';

/// https://developer.squareup.com/reference/sdks/web/payments/errors
extension type Error._(JSObject _) implements JSObject {
  external String get name;
  external String get message;
  external String? get stack;
}
