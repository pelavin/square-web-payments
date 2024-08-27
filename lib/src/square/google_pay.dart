import 'dart:js_interop';

import 'package:square_web_payments/src/square/google_pay_button_options.dart';
import 'package:web/web.dart';

import 'error.dart';
import 'token_result.dart';
import 'payment_method.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/GooglePay
class GooglePay implements PaymentMethod {
  final Future Function(HTMLDivElement element, GooglePayButtonOptions? options)
      attach;
  @override
  final Future Function() destroy;
  @override
  final Future<TokenResult> Function() tokenize;

  const GooglePay(
      {required this.attach, required this.destroy, required this.tokenize});
}

extension type JSGooglePay._(JSPaymentMethod _) implements JSPaymentMethod {
  external JSPromise attach(
      HTMLDivElement element, JSGooglePayButtonOptions? options);
  GooglePay get toDart => GooglePay(
      attach: (element, options) => attach(
              element,
              options != null
                  ? createJSInteropWrapper(options) as JSGooglePayButtonOptions
                  : null)
          .toDart,
      destroy: () => destroy().toDart,
      tokenize: () => tokenize().toDart.then(
          (tokenResult) => tokenResult.toDart,
          onError: (error) => throw (error as JSError).toDart));
}
