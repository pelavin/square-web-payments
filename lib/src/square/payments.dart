import 'dart:js_interop';

import 'error.dart';
import 'payment_method.dart';
import 'payment_request_options.dart';
import 'payment_request.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Payments
class Payments {
  final Future<PaymentMethod> Function() card;
  final Future<PaymentMethod> Function() giftCard;
  final PaymentRequest Function(PaymentRequestOptions options) paymentRequest;

  const Payments(
      {required this.card,
      required this.giftCard,
      required this.paymentRequest});
}

extension type JSPayments._(JSObject _) implements JSObject {
  external JSPromise<JSPaymentMethod> card();
  external JSPromise<JSPaymentMethod> giftCard();
  external JSPaymentRequest paymentRequest(JSPaymentRequestOptions options);
  Payments get toDart => Payments(
      card: () => card().toDart.then((paymentMethod) => paymentMethod.toDart,
          onError: (error) => throw (error as JSError).toDart),
      giftCard: () => giftCard().toDart.then(
          (paymentMethod) => paymentMethod.toDart,
          onError: (error) => throw (error as JSError).toDart),
      paymentRequest: (PaymentRequestOptions options) => paymentRequest(
              createJSInteropWrapper(options) as JSPaymentRequestOptions)
          .toDart);
}
