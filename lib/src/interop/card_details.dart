import 'dart:js_interop';

import '../models/card_details.dart' as dart;

import 'contact.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/CardDetails
extension type CardDetails._(JSObject _) implements JSObject {
  external Contact? get billing;
  external String get brand;
  external String? get cardType;
  external int get expMonth;
  external int get expYear;
  external String get last4;
  external String? get prepaidType;
  dart.CardDetails get toDart => dart.CardDetails(
      billing: billing?.toDart,
      brand: brand,
      cardType: cardType,
      expMonth: expMonth,
      expYear: expYear,
      last4: last4,
      prepaidType: prepaidType);
}
