import 'dart:js_interop';

import 'card_details.dart';
import 'gift_card_details.dart';
import '../models/token_details.dart' as dart;

/// https://developer.squareup.com/reference/sdks/web/payments/objects/TokenDetails
extension type TokenDetails._(JSObject _) implements JSObject {
  external CardDetails? get card;
  external GiftCardDetails? get giftCard;
  dart.TokenDetails get toDart =>
      dart.TokenDetails(card: card?.toDart, giftCard: giftCard?.toDart);
}
