import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:square_web_payments/square_web_payments.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Widget build(
        JSPromise<PaymentMethod> Function(Payments payments)
            paymentMethodBuilder) =>
    FutureBuilder(
        future: paymentMethodBuilder(square.payments(
                'sandbox-sq0idb-negdp6Z5Q7RYeFbAv38m0A', 'L6XCYJM4ZPHRP'))
            .toDart,
        builder: (context, snapshot) => snapshot.hasData
            ? ColoredBox(
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: PaymentMethodView(paymentMethod: snapshot.data!)))
            : const Center(child: CircularProgressIndicator()));

@widgetbook.UseCase(name: 'Card', type: PaymentMethodView)
Widget buildCard(BuildContext context) => build((payments) => payments.card());

@widgetbook.UseCase(name: 'GiftCard', type: PaymentMethodView)
Widget buildGiftCard(BuildContext context) =>
    build((payments) => payments.giftCard());
