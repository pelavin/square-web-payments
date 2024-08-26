import 'dart:js_interop';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/PaymentRequestOptions
extension type PaymentRequestOptions._(JSObject _) implements JSObject {
  external String get countryCode;
  external String get currencyCode;
}
