import 'dart:js_interop';

import 'error.dart';
import 'token_result.dart';
import 'payment_method.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/ApplePay
class ApplePay implements PaymentMethod {
  @override
  final Future<void> Function() destroy;
  @override
  final Future<TokenResult> Function() tokenize;

  const ApplePay({required this.destroy, required this.tokenize});
}

extension type JSApplePay._(JSPaymentMethod _) implements JSPaymentMethod {
  ApplePay get toDart => ApplePay(
      destroy: () => destroy().toDart,
      tokenize: () => tokenize().toDart.then(
          (tokenResult) => tokenResult.toDart,
          onError: (error) => throw (error as JSError).toDart));
}
