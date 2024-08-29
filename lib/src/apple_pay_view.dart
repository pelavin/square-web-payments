import 'dart:js_interop';

import 'package:flutter/widgets.dart';

import 'payment_html_view.dart';
import 'square/apple_pay.dart';

/// Renders the Apple Pay button.
class ApplePayView extends StatelessWidget {
  /// The [ApplePay] attached to this view.
  final ApplePay applePay;

  /// Called when the Apple Pay button is tapped or otherwise activated.
  final void Function() onPressed;

  /// Creates a [ApplePayView].
  const ApplePayView(
      {super.key, required this.applePay, required this.onPressed});

  @override
  Widget build(BuildContext context) =>
      PaymentHtmlView(onElementAttached: (element) {
        element.addEventListener('click', onPressed.toJS);
        element.style.height = '48px';
        element.style.width = '100%';
        element.style.display = 'inline-block';
        element.style.setProperty('-webkit-appearance', '-apple-pay-button');
        element.style.setProperty('-apple-pay-button-type', 'plain');
        element.style.setProperty('-apple-pay-button-style', 'black');
      });
}
