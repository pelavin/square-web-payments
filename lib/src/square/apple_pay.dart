import 'dart:js_interop';

import 'error.dart';
import 'token_result.dart';
import 'payment_method.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/ApplePay
class ApplePay implements PaymentMethod {
  final Future Function() destroy;
  @override
  final Future<TokenResult> Function() tokenize;

  const ApplePay({required this.destroy, required this.tokenize});
}

extension type JSApplePay._(JSObject _) implements JSObject {
  external JSPromise destroy();
  external JSPromise<JSTokenResult> tokenize();
  ApplePay get toDart => ApplePay(
      destroy: () => destroy().toDart,
      tokenize: () => tokenize().toDart.then(
          (tokenResult) => tokenResult.toDart,
          onError: (error) => throw (error as JSError).toDart));
}
