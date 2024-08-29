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
