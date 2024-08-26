import 'package:web/web.dart';

import 'token_result.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Card
/// https://developer.squareup.com/reference/sdks/web/payments/objects/GiftCard
class PaymentMethod {
  final Future Function(HTMLDivElement element) attach;
  final Future Function() destroy;
  final Future Function() detach;
  final Future<TokenResult> Function() tokenize;

  const PaymentMethod(
      {required this.attach,
      required this.destroy,
      required this.detach,
      required this.tokenize});
}
