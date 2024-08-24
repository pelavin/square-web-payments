import 'package:flutter/widgets.dart';
import 'package:square_web_payments/square_web_payments.dart';

import 'object_view.dart';

class CardDetailsView extends StatelessWidget {
  final CardDetails cardDetails;

  const CardDetailsView({super.key, required this.cardDetails});

  @override
  Widget build(BuildContext context) =>
      ObjectView(name: 'CardDetails', propertyNameWidth: 70, properties: [
        ...(cardDetails.billing == null
            ? []
            : [
                Property(
                    name: 'billing',
                    widget: Text(cardDetails.billing.toString()))
              ]),
        Property(name: 'brand', widget: Text(cardDetails.brand)),
        ...(cardDetails.cardType == null
            ? []
            : [
                Property(name: 'cardType', widget: Text(cardDetails.cardType!))
              ]),
        Property(
            name: 'expMonth', widget: Text(cardDetails.expMonth.toString())),
        Property(name: 'expYear', widget: Text(cardDetails.expYear.toString())),
        Property(name: 'last4', widget: Text(cardDetails.last4)),
        ...(cardDetails.prepaidType == null
            ? []
            : [
                Property(
                    name: 'prepaidType', widget: Text(cardDetails.prepaidType!))
              ])
      ]);
}
