import 'dart:js_interop';

import 'package:web/web.dart';

import 'error.dart';
import 'token_result.dart';
import 'payment_method.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Card
/// https://developer.squareup.com/reference/sdks/web/payments/objects/GiftCard
/// https://developer.squareup.com/reference/sdks/web/payments/objects/GooglePay
class AttachablePaymentMethod implements PaymentMethod {
  final Future Function(HTMLDivElement element) attach;
  @override
  final Future Function() destroy;
  final Future Function() detach;
  @override
  final Future<TokenResult> Function() tokenize;

  const AttachablePaymentMethod(
      {required this.attach,
      required this.destroy,
      required this.detach,
      required this.tokenize});
}

extension type JSAttachablePaymentMethod._(JSPaymentMethod _)
    implements JSPaymentMethod {
  external JSPromise attach(HTMLDivElement element);
  external JSPromise detach();
  AttachablePaymentMethod get toDart => AttachablePaymentMethod(
      attach: (element) => attach(element).toDart,
      destroy: () => destroy().toDart,
      detach: () => detach().toDart,
      tokenize: () => tokenize().toDart.then(
          (tokenResult) => tokenResult.toDart,
          onError: (error) => throw (error as JSError).toDart));
}
