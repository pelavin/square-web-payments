import 'dart:js_interop';

import 'apple_pay.dart';
import 'error.dart';
import 'card.dart';
import 'payment_request_options.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Payments
class Payments {
  final Future<ApplePay> Function(JSObject paymentRequest) applePay;
  final Future<Card> Function() card;
  final Future<Card> Function() giftCard;
  final JSObject Function(PaymentRequestOptions options) paymentRequest;

  const Payments(
      {required this.applePay,
      required this.card,
      required this.giftCard,
      required this.paymentRequest});
}

extension type JSPayments._(JSObject _) implements JSObject {
  external JSPromise<JSApplePay> applePay(JSObject paymentRequest);
  external JSPromise<JSPaymentMethod> card();
  external JSPromise<JSPaymentMethod> giftCard();
  external JSObject paymentRequest(JSPaymentRequestOptions options);
  Payments get toDart => Payments(
      applePay: (JSObject paymentRequest) => applePay(paymentRequest)
          .toDart
          .then((applePay) => applePay.toDart,
              onError: (error) => throw (error as JSError).toDart),
      card: () => card().toDart.then((paymentMethod) => paymentMethod.toDart,
          onError: (error) => throw (error as JSError).toDart),
      giftCard: () => giftCard().toDart.then(
          (paymentMethod) => paymentMethod.toDart,
          onError: (error) => throw (error as JSError).toDart),
      paymentRequest: (PaymentRequestOptions options) => paymentRequest(
          createJSInteropWrapper(options) as JSPaymentRequestOptions));
}
