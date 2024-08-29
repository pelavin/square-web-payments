import 'dart:js_interop';

import 'package:flutter/widgets.dart';

import 'payment_method_view.dart';
import 'square/apple_pay.dart';

class ApplePayView extends StatelessWidget {
  final ApplePay applePay;
  final void Function() onPressed;

  const ApplePayView(
      {super.key, required this.applePay, required this.onPressed});

  @override
  Widget build(BuildContext context) => PaymentMethodView(
      paymentMethod: applePay,
      onElementCreated: (element) {
        element.addEventListener('click', onPressed.toJS);
        element.style.height = '48px';
        element.style.width = '100%';
        element.style.display = 'inline-block';
        element.style.setProperty('-webkit-appearance', '-apple-pay-button');
        element.style.setProperty('-apple-pay-button-type', 'plain');
        element.style.setProperty('-apple-pay-button-style', 'black');
      });
}
