import 'dart:js_interop';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/TokenErrorDetails
extension type TokenErrorDetails._(JSObject _) implements JSObject {
  external String get field;
  external String get message;
  external String get type;
}
