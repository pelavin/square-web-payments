import 'dart:js_interop';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/PaymentRequestOptions
@JSExport()
class PaymentRequestOptions {
  @JSExport()
  final String countryCode;
  @JSExport()
  final String currencyCode;

  const PaymentRequestOptions(
      {required this.countryCode, required this.currencyCode});
}

extension type JSPaymentRequestOptions._(JSObject _) implements JSObject {
  external String get countryCode;
  external String get currencyCode;
}
