import 'dart:js_interop';

import '../models/token_error_details.dart' as dart;

/// https://developer.squareup.com/reference/sdks/web/payments/objects/TokenErrorDetails
extension type TokenErrorDetails._(JSObject _) implements JSObject {
  external String get field;
  external String get message;
  external String get type;
  dart.TokenErrorDetails get toDart =>
      dart.TokenErrorDetails(field: field, message: message, type: type);
}
