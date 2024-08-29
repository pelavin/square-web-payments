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
        element.id = 'apple-pay-button';
        element.addEventListener('click', onPressed.toJS);
      });
}
