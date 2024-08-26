import 'payment_method.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Payments
class Payments {
  final Future<PaymentMethod> Function() card;
  final Future<PaymentMethod> Function() giftCard;

  const Payments({required this.card, required this.giftCard});
}
