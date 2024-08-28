import 'dart:js_interop';

import 'package:web/web.dart';

import 'error.dart';
import 'token_result.dart';
import 'payment_method.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Card
/// https://developer.squareup.com/reference/sdks/web/payments/objects/GiftCard
class PaymentCard implements PaymentMethod {
  final Future<void> Function(HTMLDivElement element) attach;
  @override
  final Future<void> Function() destroy;
  final Future<bool> Function() detach;
  @override
  final Future<TokenResult> Function() tokenize;

  const PaymentCard(
      {required this.attach,
      required this.destroy,
      required this.detach,
      required this.tokenize});
}

extension type JSPaymentCard._(JSPaymentMethod _) implements JSPaymentMethod {
  external JSPromise attach(HTMLDivElement element);
  external JSPromise<JSBoolean> detach();
  PaymentCard get toDart => PaymentCard(
      attach: (element) => attach(element).toDart,
      destroy: () => destroy().toDart,
      detach: () => detach().toDart.then((result) => result.toDart),
      tokenize: () => tokenize().toDart.then(
          (tokenResult) => tokenResult.toDart,
          onError: (error) => throw (error as JSError).toDart));
}
