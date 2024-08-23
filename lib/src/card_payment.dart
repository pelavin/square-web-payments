import 'dart:js_interop';

import 'package:flutter/widgets.dart';

import 'interop.dart' as interop;
import 'payment_method.dart';

class CardPayment extends StatelessWidget {
  final String applicationId;
  final String locationId;
  final Widget placeholder;

  const CardPayment(
      {super.key,
      required this.applicationId,
      required this.locationId,
      required this.placeholder});

  @override
  Widget build(BuildContext context) => PaymentMethod(
      future: interop.square.payments(applicationId, locationId).card().toDart,
      placeholder: placeholder);
}
