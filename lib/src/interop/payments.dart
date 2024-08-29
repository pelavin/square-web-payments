import 'dart:js_interop';

import 'payment_method.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Payments
extension type Payments._(JSObject _) implements JSObject {
  external JSPromise<PaymentMethod> card();
  external JSPromise<PaymentMethod> giftCard();
}
