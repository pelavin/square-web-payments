import 'dart:js_interop';

import 'package:flutter/widgets.dart';

import 'interop/square.dart';
import 'interop/token_result.dart';
import 'payment_method.dart';

class GiftCardPayment extends StatelessWidget {
  final String applicationId;
  final String locationId;
  final Widget Function(Widget? view, Future<TokenResult> Function() tokenize)
      builder;

  const GiftCardPayment(
      {super.key,
      required this.applicationId,
      required this.locationId,
      required this.builder});

  @override
  Widget build(BuildContext context) => PaymentMethod(
      future: square.payments(applicationId, locationId).giftCard().toDart,
      builder: builder);
}
