import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'line_item.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/PaymentRequestOptions
class PaymentRequestOptions {
  final String countryCode;
  final String currencyCode;
  final LineItem total;

  const PaymentRequestOptions(
      {required this.countryCode,
      required this.currencyCode,
      required this.total});

  JSPaymentRequestOptions get toJS => JSPaymentRequestOptions(
      countryCode: countryCode.toJS,
      currencyCode: currencyCode.toJS,
      total: total.toJS);
}

extension type JSPaymentRequestOptions._(JSObject _) implements JSObject {
  JSPaymentRequestOptions(
      {required JSString countryCode,
      required JSString currencyCode,
      required JSLineItem total})
      : _ = JSObject()
          ..['countryCode'] = countryCode
          ..['currencyCode'] = currencyCode
          ..['total'] = total;

  external JSString get countryCode;
  external JSString get currencyCode;
  external JSLineItem get total;
}
