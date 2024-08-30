import 'dart:js_interop';

import 'package:flutter/widgets.dart';
import 'package:square_web_payments/src/square/google_pay_button_options.dart';

import 'payment_html_view.dart';
import 'square/error.dart';
import 'square/google_pay.dart';

/// Renders the Google Pay button.
class GooglePayView extends StatelessWidget {
  /// The [GooglePay] attached to this view.
  final GooglePay googlePay;

  /// The [GooglePayButtonOptions] for this view.
  final GooglePayButtonOptions? googlePayButtonOptions;

  /// Called when the Google Pay button is tapped or otherwise activated.
  final void Function() onPressed;

  /// Creates a [GooglePayView].
  const GooglePayView(
      {super.key,
      required this.googlePay,
      this.googlePayButtonOptions,
      required this.onPressed});

  @override
  Widget build(BuildContext context) => PaymentHtmlView(
      onElementAttached: (element) {
        googlePay
            .attach(element, googlePayButtonOptions)
            .ignorePaymentMethodAlreadyDestroyedError();
        element.addEventListener('click', onPressed.toJS);
      },
      onElementDetached: () =>
          googlePay.detach().ignorePaymentMethodAlreadyDestroyedError(false));
}
