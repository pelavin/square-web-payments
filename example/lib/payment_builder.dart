import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:square_web_payments/square_web_payments.dart';

class PaymentBuilder<TPaymentMethod extends PaymentMethod>
    extends StatefulWidget {
  final Future<TPaymentMethod> future;
  final Widget Function(TPaymentMethod paymentMethod, void Function() tokenize)
      builder;

  const PaymentBuilder(
      {super.key, required this.future, required this.builder});

  @override
  State<StatefulWidget> createState() => _PaymentBuilderState<TPaymentMethod>();
}

class _PaymentBuilderState<TPaymentMethod extends PaymentMethod>
    extends State<PaymentBuilder<TPaymentMethod>> {
  TPaymentMethod? paymentMethod;
  TokenResult? tokenResult;
  Object? error;

  @override
  void initState() {
    super.initState();
    widget.future.then(
        (paymentMethod) => setState(() => this.paymentMethod = paymentMethod),
        onError: (error) => setState(() => this.error = error));
  }

  @override
  Widget build(BuildContext context) => Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ...(paymentMethod == null && error == null
            ? [const Center(child: CircularProgressIndicator())]
            : []),
        ...(paymentMethod != null
            ? [widget.builder(paymentMethod!, _tokenize)]
            : []),
        ...(error != null ? [_buildJson(error)] : []),
        ...(tokenResult != null ? [_buildJson(tokenResult)] : [])
      ]));

  @override
  void dispose() {
    super.dispose();
    paymentMethod?.destroy();
  }

  void _tokenize() {
    setState(() {
      tokenResult = null;
      error = null;
    });
    paymentMethod?.tokenize().then(
        (tokenResult) => setState(() => this.tokenResult = tokenResult),
        onError: (error) => setState(() => this.error = error));
  }

  Widget _buildJson(Object? object) =>
      SelectableText(const JsonEncoder.withIndent('  ').convert(object));
}
