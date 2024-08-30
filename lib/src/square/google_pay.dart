import 'dart:js_interop';

import 'package:square_web_payments/src/square/google_pay_button_options.dart';
import 'package:web/web.dart';

import 'error.dart';
import 'token_result.dart';
import 'payment_method.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/GooglePay
class GooglePay implements PaymentMethod {
  final Future<void> Function(
      HTMLDivElement element, GooglePayButtonOptions? options) attach;
  @override
  final Future<void> Function() destroy;
  final Future<bool> Function() detach;
  @override
  final Future<TokenResult> Function() tokenize;

  const GooglePay(
      {required this.attach,
      required this.destroy,
      required this.detach,
      required this.tokenize});
}

extension type JSGooglePay._(JSPaymentMethod _) implements JSPaymentMethod {
  external JSPromise attach(
      HTMLDivElement element, JSGooglePayButtonOptions? options);
  external JSPromise<JSBoolean> detach();
  GooglePay get toDart => GooglePay(
      attach: (element, options) => tryCatchToDart(() => attach(
          element,
          options != null
              ? createJSInteropWrapper(options) as JSGooglePayButtonOptions
              : null)),
      destroy: () => tryCatchToDart(() => destroy()),
      detach: () =>
          tryCatchToDart(() => detach()).then((result) => result.toDart),
      tokenize: () => tryCatchToDart(() => tokenize())
          .then((tokenResult) => tokenResult.toDart));
}
