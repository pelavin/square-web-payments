import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:square_web_payments/square_web_payments.dart';

final Payments payments =
    Square.payments('sandbox-sq0idb-negdp6Z5Q7RYeFbAv38m0A', 'L6XCYJM4ZPHRP');

class PaymentBuilder<TPaymentMethod extends PaymentMethod>
    extends StatefulWidget {
  final Future<TPaymentMethod> Function(Payments payments) paymentMethodBuilder;
  final Widget Function(TPaymentMethod paymentMethod, void Function() tokenize)
      tokenBuilder;
  final Widget Function(void Function(VerifyBuyerDetails details) verify)?
      verifyBuilder;

  const PaymentBuilder(
      {super.key,
      required this.paymentMethodBuilder,
      required this.tokenBuilder,
      this.verifyBuilder});

  @override
  State<StatefulWidget> createState() => _PaymentBuilderState<TPaymentMethod>();
}

class _PaymentBuilderState<TPaymentMethod extends PaymentMethod>
    extends State<PaymentBuilder<TPaymentMethod>> {
  TPaymentMethod? _paymentMethod;
  Object? _paymentMethodError;
  TokenResult? _tokenResult;
  Object? _tokenError;
  VerifyBuyerResponseDetails? _verifyResult;
  Object? _verifyError;

  @override
  void initState() {
    super.initState();
    widget.paymentMethodBuilder(payments).then(
        (paymentMethod) => setState(() => this._paymentMethod = paymentMethod),
        onError: (error) => setState(() => this._paymentMethodError = error));
  }

  @override
  Widget build(BuildContext context) => Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _paymentMethod != null
            ? widget.tokenBuilder(_paymentMethod!, _tokenize)
            : _paymentMethodError != null
                ? _buildJson(_paymentMethodError)
                : const Center(child: CircularProgressIndicator()),
        ...(_tokenResult != null
            ? [
                _buildJson(_tokenResult),
                ...(widget.verifyBuilder != null
                    ? [widget.verifyBuilder!(_verify)]
                    : [])
              ]
            : _tokenError != null
                ? [_buildJson(_tokenError)]
                : []),
        ...(_verifyResult != null || _verifyError != null
            ? [_buildJson(_verifyResult ?? _verifyError)]
            : [])
      ]));

  @override
  void dispose() {
    super.dispose();
    _paymentMethod?.destroy();
  }

  void _tokenize() {
    setState(() {
      _tokenResult = null;
      _tokenError = null;
      _verifyResult = null;
      _verifyError = null;
    });
    _paymentMethod?.tokenize().then(
        (tokenResult) => setState(() => _tokenResult = tokenResult),
        onError: (error) => setState(() => _tokenError = error));
  }

  void _verify(VerifyBuyerDetails details) {
    final token = _tokenResult?.token;
    if (token == null) return;
    setState(() {
      _verifyResult = null;
      _verifyError = null;
    });
    payments.verifyBuyer(token, details).then(
        (verifyResult) => setState(() => _verifyResult = verifyResult),
        onError: (error) => setState(() => _verifyError = error));
  }

  Widget _buildJson(Object? object) =>
      SelectableText(const JsonEncoder.withIndent('  ').convert(object));
}
