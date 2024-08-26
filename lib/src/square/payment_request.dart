import 'dart:js_interop';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/PaymentRequest
class PaymentRequest {}

extension type JSPaymentRequest._(JSObject _) implements JSObject {
  PaymentRequest get toDart => PaymentRequest();
}
