import 'package:flutter/widgets.dart';
import 'package:square_web_payments/src/square/google_pay_button_options.dart';

import 'payment_method_view.dart';
import 'square/google_pay.dart';

/// Renders the Google Pay button.
class GooglePayView extends StatelessWidget {
  /// The [GooglePay] attached to this view.
  final GooglePay googlePay;

  /// The [GooglePayButtonOptions] for this view.
  final GooglePayButtonOptions? googlePayButtonOptions;

  /// Creates a [GooglePayView].
  const GooglePayView(
      {super.key, required this.googlePay, this.googlePayButtonOptions});

  @override
  Widget build(BuildContext context) => PaymentMethodView(
      paymentMethod: googlePay,
      onElementAttached: (element) =>
          googlePay.attach(element, googlePayButtonOptions));
}
