import 'dart:js_interop';

import 'line_item.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/PaymentRequestOptions
@JSExport()
class PaymentRequestOptions {
  @JSExport()
  final String countryCode;
  @JSExport()
  final String currencyCode;

  @JSExport('_total')
  final LineItem total;

  const PaymentRequestOptions(
      {required this.countryCode,
      required this.currencyCode,
      required this.total});

  @JSExport('total')
  JSLineItem get jsTotal => createJSInteropWrapper(total) as JSLineItem;
}

extension type JSPaymentRequestOptions._(JSObject _) implements JSObject {
  external String get countryCode;
  external String get currencyCode;
  external JSLineItem get total;
}
