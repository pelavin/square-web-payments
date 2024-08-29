import 'package:flutter/material.dart';
import 'package:square_web_payments/square_web_payments.dart';

import 'error_view.dart';
import 'token_result_view.dart';

class PaymentView extends StatefulWidget {
  final Widget? view;
  final Future<TokenResult> Function() tokenize;

  const PaymentView({super.key, required this.view, required this.tokenize});

  @override
  State<StatefulWidget> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  TokenResult? tokenResult;
  Error? error;

  @override
  Widget build(BuildContext context) => ColoredBox(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: widget.view == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                      SizedBox(height: 90, child: widget.view!),
                      const SizedBox(height: 6),
                      TextButton(
                          onPressed: _tokenize, child: const Text('TOKENIZE')),
                      ...(tokenResult == null
                          ? []
                          : [
                              const SizedBox(height: 6),
                              TokenResultView(tokenResult: tokenResult!)
                            ]),
                      ...(error == null
                          ? []
                          : [
                              const SizedBox(height: 6),
                              ErrorView(error: error!)
                            ])
                    ])));

  void _tokenize() {
    setState(() => tokenResult = null);
    widget
        .tokenize()
        .then((tokenResult) => setState(() => this.tokenResult = tokenResult))
        .catchError((error) => setState(() => this.error = error as Error));
  }
}
