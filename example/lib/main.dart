import 'dart:convert';

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
            builder: (context) => _buildPaymentMethod(
                payments.applePay(payments.paymentRequest(
                    const PaymentRequestOptions(
                        countryCode: 'US',
                        currencyCode: 'USD',
                        total: LineItem(amount: '1.00', label: 'Total')))),
                (applePay) => ApplePayView(
                    applePay: applePay,
                    onPressed: () => _tokenize(context, applePay)))),
        WidgetbookUseCase(
            name: 'Card',
            builder: (context) => _buildPaymentMethod(
                payments.card(),
                (card) => Column(children: [
                      CardView(card: card),
                      TextButton(
                          onPressed: () => _tokenize(context, card),
                          child: const Text('Tokenize'))
                    ]))),
        WidgetbookUseCase(
            name: 'Gift Card',
            builder: (context) => _buildPaymentMethod(
                payments.giftCard(),
                (giftCard) => Column(children: [
                      CardView(card: giftCard),
                      TextButton(
                          onPressed: () => _tokenize(context, giftCard),
                          child: const Text('Tokenize'))
                    ]))),
        WidgetbookUseCase(
            name: 'Google Pay',
            builder: (context) => _buildPaymentMethod(
                payments.googlePay(payments.paymentRequest(
                    const PaymentRequestOptions(
                        countryCode: 'US',
                        currencyCode: 'USD',
                        total: LineItem(amount: '1.00', label: 'Total')))),
                (googlePay) => GooglePayView(
                    googlePay: googlePay,
                    googlePayButtonOptions:
                        const GooglePayButtonOptions(buttonSizeMode: 'fill'),
                    onPressed: () => _tokenize(context, googlePay)))),
      ]);

  Widget _buildPaymentMethod<TPaymentMethod extends PaymentMethod>(
          Future<TPaymentMethod> future,
          Widget Function(TPaymentMethod paymentMethod) builder) =>
      Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.all(8),
          child: FutureBuilder(
              future: future,
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.done
                      ? snapshot.data != null
                          ? builder(snapshot.data!)
                          : SelectableText(const JsonEncoder.withIndent('  ')
                              .convert(snapshot.error))
                      : const Center(child: CircularProgressIndicator())));

  void _tokenize(BuildContext context, PaymentMethod paymentMethod) =>
      paymentMethod.tokenize().then(
          (tokenResult) => _showDialog(context, 'TokenResult', tokenResult),
          onError: (error) => _showDialog(context, 'Error', error));

  void _showDialog(BuildContext context, String title, Object content) =>
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
              title: Text(title),
              content: SelectableText(
                  const JsonEncoder.withIndent('  ').convert(content))));
}
