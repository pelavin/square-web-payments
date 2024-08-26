import 'dart:convert';
import 'dart:js_interop';

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

  Widget _buildPayment(BuildContext context, PaymentMethodView? view) =>
      Container(
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

  void _tokenize(BuildContext context, PaymentMethodView view) => showDialog(
      context: context,
      builder: (BuildContext context) => FutureBuilder(
          future: view.paymentMethod.tokenize().toDart,
          builder: (context, snapshot) {
            String? title;
            Map<String, dynamic>? content;
            if (snapshot.hasData) {
              title = 'TokenResult';
              content = snapshot.data!.toJson();
            } else if (snapshot.hasError) {
              title = 'Error';
              content = (snapshot.error as Error).toJson();
            }

            return AlertDialog(
                title: title != null
                    ? Text(title)
                    : const Center(child: CircularProgressIndicator()),
                content: content != null
                    ? SelectableText(
                        const JsonEncoder.withIndent('  ').convert(content))
                    : null);
          }));
}

extension on Error {
  Map<String, dynamic> toJson() =>
      {'name': name, 'message': message, 'stack': stack};
}

extension on TokenResult {
  Map<String, dynamic> toJson() => {
        'details': details == null
            ? null
            : {
                'card': details?.card == null ? null : {},
                'giftCard': details?.giftCard == null ? null : {}
              },
        'errors': errors?.toDart
            .map((error) => {
                  'field': error.field,
                  'message': error.message,
                  'type': error.type
                })
            .toList(),
        'status': status,
        'token': token
      };
}
