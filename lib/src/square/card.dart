import 'dart:js_interop';

import 'package:web/web.dart';

import 'error.dart';
import 'token_result.dart';
import 'payment_method.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Card
/// https://developer.squareup.com/reference/sdks/web/payments/objects/GiftCard
class Card implements PaymentMethod {
  final Future Function(HTMLDivElement element) attach;
  @override
  final Future Function() destroy;
  @override
  final Future<TokenResult> Function() tokenize;

  const Card(
      {required this.attach, required this.destroy, required this.tokenize});
}

extension type JSCard._(JSPaymentMethod _) implements JSPaymentMethod {
  external JSPromise attach(HTMLDivElement element);
  Card get toDart => Card(
      attach: (element) => attach(element).toDart,
      destroy: () => destroy().toDart,
      tokenize: () => tokenize().toDart.then(
          (tokenResult) => tokenResult.toDart,
          onError: (error) => throw (error as JSError).toDart));
}
