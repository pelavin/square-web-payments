import 'package:flutter/material.dart';
import 'package:square_web_payments/square_web_payments.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'payment_view.dart';

@widgetbook.UseCase(name: 'Default', type: GiftCardPayment)
Widget build(BuildContext context) => GiftCardPayment(
    applicationId: 'sandbox-sq0idb-negdp6Z5Q7RYeFbAv38m0A',
    locationId: 'L6XCYJM4ZPHRP',
    builder: (view) => PaymentView(view: view));
