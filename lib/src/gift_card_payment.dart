import 'dart:js_interop';

import 'package:flutter/widgets.dart';

import 'interop/square.dart';
import 'payment.dart';
import 'payment_view.dart';

class GiftCardPayment extends StatelessWidget {
  final String applicationId;
  final String locationId;
  final Widget Function(PaymentView? view) builder;

  const GiftCardPayment(
      {super.key,
      required this.applicationId,
      required this.locationId,
      required this.builder});

  @override
  Widget build(BuildContext context) => Payment(
      future: square.payments(applicationId, locationId).giftCard().toDart,
      builder: builder);
}
