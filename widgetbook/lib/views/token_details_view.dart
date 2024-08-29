import 'package:flutter/widgets.dart';
import 'package:square_web_payments/square_web_payments.dart';

import 'card_details_view.dart';
import 'gift_card_details_view.dart';
import 'object_view.dart';

class TokenDetailsView extends StatelessWidget {
  final TokenDetails tokenDetails;

  const TokenDetailsView({super.key, required this.tokenDetails});

  @override
  Widget build(BuildContext context) =>
      ObjectView(name: 'TokenDetails', propertyNameWidth: 60, properties: [
        ...(tokenDetails.card == null
            ? []
            : [
                Property(
                    name: 'card',
                    widget: CardDetailsView(cardDetails: tokenDetails.card!))
              ]),
        ...(tokenDetails.giftCard == null
            ? []
            : [
                Property(
                    name: 'giftCard',
                    widget: GiftCardDetailsView(
                        giftCardDetails: tokenDetails.giftCard!))
              ]),
      ]);
}
