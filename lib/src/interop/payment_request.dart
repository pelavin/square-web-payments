import 'dart:js_interop';

import '../models/payment_request.dart' as dart;

/// https://developer.squareup.com/reference/sdks/web/payments/objects/PaymentRequest
extension type PaymentRequest._(JSObject _) implements JSObject {
  dart.PaymentRequest get toDart => dart.PaymentRequest();
}
