import 'dart:js_interop';

import 'package:web/web.dart';

import 'token_result.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Card
/// https://developer.squareup.com/reference/sdks/web/payments/objects/GiftCard
extension type PaymentMethod._(JSObject _) implements JSObject {
  external String get id;
  external JSPromise attach(HTMLDivElement element);
  external JSPromise destroy();
  external JSPromise detach();
  external JSPromise<TokenResult> tokenize();
}
