import 'dart:js_interop';

import 'apple_pay.dart';
import 'error.dart';
import 'google_pay.dart';
import 'payment_card.dart';
import 'payment_request_options.dart';
import 'verify_buyer_details.dart';
import 'verify_buyer_response_details.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Payments
class Payments {
  final Future<ApplePay> Function(JSObject paymentRequest) applePay;
  final Future<PaymentCard> Function() card;
  final Future<PaymentCard> Function() giftCard;
  final Future<GooglePay> Function(JSObject paymentRequest) googlePay;
  final JSObject Function(PaymentRequestOptions options) paymentRequest;
  final Future<VerifyBuyerResponseDetails> Function(
      String source, VerifyBuyerDetails details) verifyBuyer;

  const Payments(
      {required this.applePay,
      required this.card,
      required this.giftCard,
      required this.googlePay,
      required this.paymentRequest,
      required this.verifyBuyer});
}

extension type JSPayments._(JSObject _) implements JSObject {
  external JSPromise<JSApplePay> applePay(JSObject paymentRequest);
  external JSPromise<JSPaymentCard> card();
  external JSPromise<JSPaymentCard> giftCard();
  external JSPromise<JSGooglePay> googlePay(JSObject paymentRequest);
  external JSObject paymentRequest(JSPaymentRequestOptions options);
  external JSPromise<JSVerifyBuyerResponseDetails> verifyBuyer(
      String source, JSVerifyBuyerDetails details);
  Payments get toDart => Payments(
      applePay: (JSObject paymentRequest) =>
          tryCatchToDart(() => applePay(paymentRequest))
              .then((applePay) => applePay.toDart),
      card: () => tryCatchToDart(() => card()).then((card) => card.toDart),
      giftCard: () =>
          tryCatchToDart(() => giftCard()).then((giftCard) => giftCard.toDart),
      googlePay: (JSObject paymentRequest) =>
          tryCatchToDart(() => googlePay(paymentRequest))
              .then((googlePlay) => googlePlay.toDart),
      paymentRequest: (PaymentRequestOptions options) {
        try {
          return paymentRequest(
              createJSInteropWrapper(options) as JSPaymentRequestOptions);
        } catch (error) {
          throw (error as JSError).toDart;
        }
      },
      verifyBuyer: (String source, VerifyBuyerDetails details) =>
          tryCatchToDart(() => verifyBuyer(source, details.toJS))
              .then((responseDetails) => responseDetails.toDart));
}
