import 'dart:js_interop';

import 'package:web/web.dart';

import 'error.dart';
import 'token_result.dart';
import '../models/payment_method.dart' as dart;

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Card
/// https://developer.squareup.com/reference/sdks/web/payments/objects/GiftCard
extension type PaymentMethod._(JSObject _) implements JSObject {
  external JSPromise attach(HTMLDivElement element);
  external JSPromise destroy();
  external JSPromise detach();
  external JSPromise<TokenResult> tokenize();
  dart.PaymentMethod get toDart => dart.PaymentMethod(
      attach: (element) => attach(element).toDart,
      destroy: () => destroy().toDart,
      detach: () => detach().toDart,
      tokenize: () => tokenize().toDart.then(
          (tokenResult) => tokenResult.toDart,
          onError: (error) => throw (error as Error).toDart));
}
