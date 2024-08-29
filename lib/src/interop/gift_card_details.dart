import 'dart:js_interop';

import '../models/gift_card_details.dart' as dart;

/// https://developer.squareup.com/reference/sdks/web/payments/objects/GiftCardDetails
extension type GiftCardDetails._(JSObject _) implements JSObject {
  external String? get type;
  dart.GiftCardDetails get toDart => dart.GiftCardDetails(type: type);
}
