import 'package:flutter/widgets.dart';

import 'payment_method_view.dart';
import 'square/card.dart';

/// Renders the Card or Gift Card form.
class CardView extends StatelessWidget {
  /// The [Card] attached to this view.
  final Card card;

  /// Creates a [CardView].
  const CardView({super.key, required this.card});

  @override
  Widget build(BuildContext context) => PaymentMethodView(
      paymentMethod: card,
      onElementAttached: (element) => card.attach(element));
}
