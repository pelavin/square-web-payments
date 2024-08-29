import 'package:flutter/widgets.dart';

import 'models/square.dart';
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
      future: Square.payments(applicationId, locationId).giftCard(),
      builder: builder);
}
