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
