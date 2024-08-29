import 'package:flutter/widgets.dart';

import 'interop/square.dart';
import 'payment.dart';
import 'payment_view.dart';

class CardPayment extends StatelessWidget {
  final String applicationId;
  final String locationId;
  final Widget Function(PaymentView? view) builder;

  const CardPayment(
      {super.key,
      required this.applicationId,
      required this.locationId,
      required this.builder});

  @override
  Widget build(BuildContext context) => Payment(
      future: square.payments(applicationId, locationId).toDart.card(),
      builder: builder);
}
