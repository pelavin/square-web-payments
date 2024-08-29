import 'dart:js_interop';

import 'apple_pay.dart';
import 'error.dart';
import 'attachable_payment_method.dart';
import 'payment_request_options.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Payments
class Payments {
  final Future<ApplePay> Function(JSObject paymentRequest) applePay;
  final Future<AttachablePaymentMethod> Function() card;
  final Future<AttachablePaymentMethod> Function() giftCard;
  final Future<AttachablePaymentMethod> Function(JSObject paymentRequest)
      googlePay;
  final JSObject Function(PaymentRequestOptions options) paymentRequest;

  const Payments(
      {required this.applePay,
      required this.card,
      required this.giftCard,
      required this.googlePay,
      required this.paymentRequest});
}

extension type JSPayments._(JSObject _) implements JSObject {
  external JSPromise<JSApplePay> applePay(JSObject paymentRequest);
  external JSPromise<JSAttachablePaymentMethod> card();
  external JSPromise<JSAttachablePaymentMethod> giftCard();
  external JSPromise<JSAttachablePaymentMethod> googlePay(
      JSObject paymentRequest);
  external JSObject paymentRequest(JSPaymentRequestOptions options);
  Payments get toDart => Payments(
      applePay: (JSObject paymentRequest) => applePay(paymentRequest)
          .toDart
          .then((applePay) => applePay.toDart,
              onError: (error) => throw (error as JSError).toDart),
      card: () => card().toDart.then((card) => card.toDart,
          onError: (error) => throw (error as JSError).toDart),
      giftCard: () => giftCard().toDart.then((giftCard) => giftCard.toDart,
          onError: (error) => throw (error as JSError).toDart),
      googlePay: (JSObject paymentRequest) => googlePay(paymentRequest)
          .toDart
          .then((googlePlay) => googlePlay.toDart,
              onError: (error) => throw (error as JSError).toDart),
      paymentRequest: (PaymentRequestOptions options) =>
          paymentRequest(createJSInteropWrapper(options) as JSPaymentRequestOptions));
}
