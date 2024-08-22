import 'dart:js_interop';

import 'package:web/web.dart';

@JS('Square')
external Square get square;

extension type Square._(JSObject _) implements JSObject {
  external Payments payments(String applicationId, String locationId);
}

extension type Payments._(JSObject _) implements JSObject {
  external JSPromise<PaymentMethod> card();
  external JSPromise<PaymentMethod> giftCard();
}

extension type PaymentMethod._(JSObject _) implements JSObject {
  external String get id;
  external JSPromise attach(HTMLDivElement element);
  external JSPromise destroy();
  external JSPromise detach();
  external JSPromise<TokenResult> tokenize();
}

extension type TokenResult._(JSObject _) implements JSObject {
  external JSAny get errors;
  external String get status;
  external String get token;
}

extension type Error._(JSObject _) implements JSObject {
  external String get name;
  external String get message;
  external String? get stack;
}
