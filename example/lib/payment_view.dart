import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:square_web_payments/square_web_payments.dart';

class PaymentView extends StatefulWidget {
  final PaymentMethodView? view;

  const PaymentView({super.key, required this.view});

  @override
  State<StatefulWidget> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  TokenResult? tokenResult;
  Error? error;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: widget.view == null
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        Container(
                            constraints: const BoxConstraints(minHeight: 90),
                            child: widget.view!),
                        const SizedBox(height: 6),
                        TextButton(
                            onPressed: _tokenize,
                            child: const Text('TOKENIZE')),
                        ...(tokenResult == null
                            ? []
                            : [
                                const SizedBox(height: 6),
                                Text(tokenResultToJson(tokenResult!))
                              ]),
                        ...(error == null
                            ? []
                            : [
                                const SizedBox(height: 6),
                                Text(errorToJson(error!))
                              ])
                      ])));
  }

  void _tokenize() {
    setState(() {
      tokenResult = null;
      error = null;
    });
    widget.view?.paymentMethod
        .tokenize()
        .toDart
        .then((tokenResult) => setState(() => this.tokenResult = tokenResult))
        .catchError((error) => setState(() => this.error = error as Error));
  }

  String errorToJson(Error error) => const JsonEncoder.withIndent('  ').convert(
      {'name': error.name, 'message': error.message, 'stack': error.stack});

  String tokenResultToJson(TokenResult tokenResult) =>
      const JsonEncoder.withIndent('  ').convert({
        'details': tokenResult.details == null
            ? null
            : {
                'card': tokenResult.details?.card == null ? null : {},
                'giftCard': tokenResult.details?.giftCard == null ? null : {}
              },
        'errors': tokenResult.errors?.toDart
            .map((error) => {
                  'field': error.field,
                  'message': error.message,
                  'type': error.type
                })
            .toList(),
        'status': tokenResult.status,
        'token': tokenResult.token
      });
}
