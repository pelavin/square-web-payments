import 'dart:js_interop';

import 'contact.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/CardDetails
class CardDetails {
  final Contact? billing;
  final String brand;
  final String? cardType;
  final int expMonth;
  final int expYear;
  final String last4;
  final String? prepaidType;

  const CardDetails(
      {required this.billing,
      required this.brand,
      required this.cardType,
      required this.expMonth,
      required this.expYear,
      required this.last4,
      required this.prepaidType});

  Map<String, dynamic> toJson() => {
        ...(billing == null ? {} : {'billing': billing}),
        'brand': brand,
        ...(cardType == null ? {} : {'cardType': cardType}),
        'expMonth': expMonth,
        'expYear': expYear,
        'last4': last4,
        ...(prepaidType == null ? {} : {'prepaidType': prepaidType})
      };
}

extension type JSCardDetails._(JSObject _) implements JSObject {
  external JSContact? get billing;
  external String get brand;
  external String? get cardType;
  external int get expMonth;
  external int get expYear;
  external String get last4;
  external String? get prepaidType;
  CardDetails get toDart => CardDetails(
      billing: billing?.toDart,
      brand: brand,
      cardType: cardType,
      expMonth: expMonth,
      expYear: expYear,
      last4: last4,
      prepaidType: prepaidType);
}
