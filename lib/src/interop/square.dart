import 'dart:js_interop';

import 'payments.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Square
extension type Square._(JSObject _) implements JSObject {
  external Payments payments(String applicationId, String locationId);
}

@JS('Square')
external Square get square;
