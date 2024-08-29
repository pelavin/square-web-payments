import 'dart:js_interop';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/CardDetails
extension type CardDetails._(JSObject _) implements JSObject {
  external JSObject? get billing;
  external String get brand;
  external String? get cardType;
  external int get expMonth;
  external int get expYear;
  external String get last4;
  external String? get prepaidType;
}
