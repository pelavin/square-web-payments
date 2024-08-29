import 'package:flutter/widgets.dart';

import 'payment_method_view.dart';
import 'square/card.dart';

class CardView extends StatelessWidget {
  final Card card;

  const CardView({super.key, required this.card});

  @override
  Widget build(BuildContext context) => PaymentMethodView(
      paymentMethod: card, onElementCreated: (element) => card.attach(element));
}
