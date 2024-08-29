import 'dart:js_interop';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/GiftCardDetails
class GiftCardDetails {
  final String? type;

  const GiftCardDetails({required this.type});

  Map<String, dynamic> toJson() => type == null ? {} : {'type': type};
}

extension type JSGiftCardDetails._(JSObject _) implements JSObject {
  external String? get type;
  GiftCardDetails get toDart => GiftCardDetails(type: type);
}
