import 'package:flutter/widgets.dart';

import 'payment_method_view.dart';
import 'square/attachable_payment_method.dart';

/// Renders the Card, Gift Card or Google Pay views.
class AttachablePaymentMethodView extends StatelessWidget {
  /// The [AttachablePaymentMethod] attached to this view.
  final AttachablePaymentMethod paymentMethod;

  /// Creates a [AttachablePaymentMethodView].
  const AttachablePaymentMethodView({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) => PaymentMethodView(
      paymentMethod: paymentMethod,
      onElementAttached: (element) => paymentMethod.attach(element));
}
