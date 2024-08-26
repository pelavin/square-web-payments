import 'dart:js_interop';

import 'card_details.dart';
import 'gift_card_details.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/TokenDetails
class TokenDetails {
  final CardDetails? card;
  final GiftCardDetails? giftCard;

  const TokenDetails({required this.card, required this.giftCard});

  Map<String, dynamic> toJson() => {
        ...(card == null ? {} : {'card': card}),
        ...(giftCard == null ? {} : {'giftCard': giftCard})
      };
}

extension type JSTokenDetails._(JSObject _) implements JSObject {
  external JSCardDetails? get card;
  external JSGiftCardDetails? get giftCard;
  TokenDetails get toDart =>
      TokenDetails(card: card?.toDart, giftCard: giftCard?.toDart);
}
