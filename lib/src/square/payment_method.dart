import 'dart:js_interop';

import 'token_result.dart';

abstract class PaymentMethod {
  Future Function() get destroy;
  Future<TokenResult> Function() get tokenize;
}

extension type JSPaymentMethod._(JSObject _) implements JSObject {
  external JSPromise destroy();
  external JSPromise<JSTokenResult> tokenize();
}
