import 'package:flutter/widgets.dart';

import 'payment_method_view.dart';
import 'square/apple_pay.dart';

class ApplePayView extends StatelessWidget {
  final ApplePay applePay;

  const ApplePayView({super.key, required this.applePay});

  @override
  Widget build(BuildContext context) => PaymentMethodView(
      paymentMethod: applePay,
      onElementCreated: (element) => element.id = 'apple-pay-button');
}
