import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:square_web_payments/square_web_payments.dart';
import 'package:widgetbook/widgetbook.dart';

const applicationId = 'sandbox-sq0idb-negdp6Z5Q7RYeFbAv38m0A';
const locationId = 'L6XCYJM4ZPHRP';

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) => Widgetbook.material(directories: [
        WidgetbookUseCase(
            name: "CardPayment",
            builder: (context) => CardPayment(
                applicationId: applicationId,
                locationId: locationId,
                builder: (view) => _buildPayment(context, view))),
        WidgetbookUseCase(
            name: "GiftCardPayment",
            builder: (context) => GiftCardPayment(
                applicationId: applicationId,
                locationId: locationId,
                builder: (view) => _buildPayment(context, view))),
      ]);

  Widget _buildPayment(BuildContext context, PaymentView? view) => Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(8),
      child: view == null
          ? const Center(child: CircularProgressIndicator())
          : Column(children: [
              view,
              TextButton(
                  onPressed: () => _tokenize(context, view),
                  child: const Text('Tokenize'))
            ]));

  void _tokenize(BuildContext context, PaymentView view) => showDialog(
      context: context,
      builder: (BuildContext context) => FutureBuilder(
          future: view.tokenize(),
          builder: (context, snapshot) => AlertDialog(
              title: snapshot.connectionState == ConnectionState.done
                  ? Text(snapshot.hasData ? 'TokenResult' : 'Error')
                  : const Center(child: CircularProgressIndicator()),
              content: snapshot.connectionState == ConnectionState.done
                  ? SelectableText(const JsonEncoder.withIndent('  ')
                      .convert(snapshot.data ?? snapshot.error))
                  : null)));
}
