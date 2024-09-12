import 'package:flutter/material.dart';
import 'package:square_web_payments/square_web_payments.dart';
import 'package:widgetbook/widgetbook.dart';

import 'payment_builder.dart';

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
                paymentMethodBuilder: (payments) => payments.applePay(
                    payments.paymentRequest(const PaymentRequestOptions(
                        countryCode: 'US',
                        currencyCode: 'USD',
                        total: LineItem(amount: '1.00', label: 'Total')))),
                tokenBuilder: (applePay, tokenize) =>
                    ApplePayView(applePay: applePay, onPressed: tokenize))),
        WidgetbookUseCase(
            name: 'Card',
            builder: (context) => PaymentBuilder(
                paymentMethodBuilder: (payments) => payments.card(),
                tokenBuilder: (card, tokenize) => Column(children: [
                      CardView(card: card),
                      TextButton(
                          onPressed: tokenize, child: const Text('Tokenize'))
                    ]),
                verifyBuilder: (verify) => Center(
                    child: TextButton(
                        onPressed: () => verify(VerifyBuyerDetails(
                            amount: '1.00',
                            billingContact: const Contact(
                                addressLines: ['1600 Pennsylvania Ave NW'],
                                city: 'Washington',
                                countryCode: 'US',
                                email: 'john.doe@example.com',
                                familyName: 'Doe',
                                givenName: 'John',
                                phone: '3214563987',
                                postalCode: '20500',
                                state: 'DC'),
                            currencyCode: 'USD',
                            intent: 'CHARGE')),
                        child: const Text('Verify'))))),
        WidgetbookUseCase(
            name: 'Gift Card',
            builder: (context) => PaymentBuilder(
                paymentMethodBuilder: (payments) => payments.giftCard(),
                tokenBuilder: (giftCard, tokenize) => Column(children: [
                      CardView(card: giftCard),
                      TextButton(
                          onPressed: tokenize, child: const Text('Tokenize'))
                    ]))),
        WidgetbookUseCase(
            name: 'Google Pay',
            builder: (context) => PaymentBuilder(
                paymentMethodBuilder: (payments) => payments.googlePay(
                    payments.paymentRequest(const PaymentRequestOptions(
                        countryCode: 'US',
                        currencyCode: 'USD',
                        total: LineItem(amount: '1.00', label: 'Total')))),
                tokenBuilder: (googlePay, tokenize) => GooglePayView(
                    googlePay: googlePay,
                    googlePayButtonOptions:
                        const GooglePayButtonOptions(buttonSizeMode: 'fill'),
                    onPressed: tokenize))),
      ]);
}
