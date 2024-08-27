import 'package:flutter/widgets.dart';

import 'payment_method_view.dart';
import 'square/payment_card.dart';

/// Renders the Card or Gift Card form.
class CardView extends StatelessWidget {
  /// The [PaymentCard] attached to this view.
  final PaymentCard card;

  /// Creates a [CardView].
  const CardView({super.key, required this.card});

  @override
  Widget build(BuildContext context) => PaymentMethodView(
      paymentMethod: card,
      onElementAttached: (element) => card.attach(element));
}
