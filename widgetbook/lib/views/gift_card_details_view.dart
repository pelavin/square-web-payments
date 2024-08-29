import 'package:flutter/widgets.dart';
import 'package:square_web_payments/square_web_payments.dart';

import 'object_view.dart';

class GiftCardDetailsView extends StatelessWidget {
  final GiftCardDetails giftCardDetails;

  const GiftCardDetailsView({super.key, required this.giftCardDetails});

  @override
  Widget build(BuildContext context) => ObjectView(
      name: 'CardDetails',
      propertyNameWidth: 40,
      properties: giftCardDetails.type == null
          ? []
          : [Property(name: 'type', widget: Text(giftCardDetails.type!))]);
}
