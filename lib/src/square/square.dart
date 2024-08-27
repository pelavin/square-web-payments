import 'dart:js_interop';

import 'payments.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Square
class Square {
  static Payments payments(String applicationId, String locationId) =>
      square.payments(applicationId, locationId).toDart;
}

extension type JSSquare._(JSObject _) implements JSObject {
  external JSPayments payments(String applicationId, String locationId);
}

@JS('Square')
external JSSquare get square;
