import 'dart:js_interop';

import '../models/error.dart' as dart;

/// https://developer.squareup.com/reference/sdks/web/payments/errors
extension type Error._(JSObject _) implements JSObject {
  external String get name;
  external String get message;
  external String? get stack;
  dart.Error get toDart =>
      dart.Error(name: name, message: message, stack: stack);
}
