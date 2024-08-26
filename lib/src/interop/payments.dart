import 'dart:js_interop';

import 'error.dart';
import 'payment_method.dart';
import '../models/payments.dart' as dart;

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Payments
extension type Payments._(JSObject _) implements JSObject {
  external JSPromise<PaymentMethod> card();
  external JSPromise<PaymentMethod> giftCard();
  dart.Payments get toDart => dart.Payments(
      card: () => card().toDart.then((paymentMethod) => paymentMethod.toDart,
          onError: (error) => throw (error as Error).toDart),
      giftCard: () => giftCard().toDart.then(
          (paymentMethod) => paymentMethod.toDart,
          onError: (error) => throw (error as Error).toDart));
}
