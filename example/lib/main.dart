import 'package:flutter/material.dart';
import 'package:square_web_payments/square_web_payments.dart';
import 'package:widgetbook/widgetbook.dart';

import 'payment_builder.dart';

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
            builder: (context) => PaymentBuilder(
                future: payments.applePay(payments.paymentRequest(
                    const PaymentRequestOptions(
                        countryCode: 'US',
                        currencyCode: 'USD',
                        total: LineItem(amount: '1.00', label: 'Total')))),
                builder: (applePay, tokenize) =>
                    ApplePayView(applePay: applePay, onPressed: tokenize))),
        WidgetbookUseCase(
            name: 'Card',
            builder: (context) => PaymentBuilder(
                future: payments.card(),
                builder: (card, tokenize) => Column(children: [
                      CardView(card: card),
                      TextButton(
                          onPressed: tokenize, child: const Text('Tokenize'))
                    ]))),
        WidgetbookUseCase(
            name: 'Gift Card',
            builder: (context) => PaymentBuilder(
                future: payments.giftCard(),
                builder: (giftCard, tokenize) => Column(children: [
                      CardView(card: giftCard),
                      TextButton(
                          onPressed: tokenize, child: const Text('Tokenize'))
                    ]))),
        WidgetbookUseCase(
            name: 'Google Pay',
            builder: (context) => PaymentBuilder(
                future: payments.googlePay(payments.paymentRequest(
                    const PaymentRequestOptions(
                        countryCode: 'US',
                        currencyCode: 'USD',
                        total: LineItem(amount: '1.00', label: 'Total')))),
                builder: (googlePay, tokenize) => GooglePayView(
                    googlePay: googlePay,
                    googlePayButtonOptions:
                        const GooglePayButtonOptions(buttonSizeMode: 'fill'),
                    onPressed: tokenize))),
      ]);
}
