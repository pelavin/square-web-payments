/// https://developer.squareup.com/reference/sdks/web/payments/objects/GiftCardDetails
class GiftCardDetails {
  final String? type;

  const GiftCardDetails({required this.type});

  Map<String, dynamic> toJson() => type == null ? {} : {'type': type};
}
