import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:square_web_payments/square_web_payments.dart';
import 'package:widgetbook/widgetbook.dart';

final Payments payments =
    Square.payments('sandbox-sq0idb-negdp6Z5Q7RYeFbAv38m0A', 'L6XCYJM4ZPHRP');

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) => Widgetbook.material(directories: [
        WidgetbookUseCase(
            name: 'Apple Pay',
            builder: (context) {
              final PaymentRequest paymentRequest = payments.paymentRequest(
                  const PaymentRequestOptions(
                      countryCode: 'US', currencyCode: 'USD'));
              print(inspect(paymentRequest));
              return const Placeholder();
            }),
        WidgetbookUseCase(
            name: 'Card', builder: (context) => _buildPayment(payments.card())),
        WidgetbookUseCase(
            name: 'Gift Card',
            builder: (context) => _buildPayment(payments.giftCard()))
      ]);

  Widget _buildPayment(Future<PaymentMethod> future) => Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(8),
      child: FutureBuilder(
          future: future,
          builder: (context, snapshot) => snapshot.data == null
              ? const Center(child: CircularProgressIndicator())
              : Column(children: [
                  PaymentMethodView(paymentMethod: snapshot.data!),
                  TextButton(
                      onPressed: () => _tokenize(context, snapshot.data!),
                      child: const Text('Tokenize'))
                ])));

  void _tokenize(BuildContext context, PaymentMethod paymentMethod) =>
      showDialog(
          context: context,
          builder: (BuildContext context) => FutureBuilder(
              future: paymentMethod.tokenize(),
              builder: (context, snapshot) => AlertDialog(
                  title: snapshot.connectionState == ConnectionState.done
                      ? Text(snapshot.hasData ? 'TokenResult' : 'Error')
                      : const Center(child: CircularProgressIndicator()),
                  content: snapshot.connectionState == ConnectionState.done
                      ? SelectableText(const JsonEncoder.withIndent('  ')
                          .convert(snapshot.data ?? snapshot.error))
                      : null)));
}
