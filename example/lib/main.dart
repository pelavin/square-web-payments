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
                tokenBuilder: _buildCardView,
                verifyBuilder: (verify) => Center(
                    child: TextButton(
                        onPressed: () => verify(VerifyBuyerDetails(
                            amount: '1.00',
                            billingContact: const Contact(
                                addressLines: ['123 East Main Street', '#111'],
                                city: 'Seattle',
                                countryCode: 'US',
                                email: 'johndoe@example.com',
                                familyName: 'Doe',
                                givenName: 'John',
                                phone: '+12065551212',
                                postalCode: '98111',
                                state: 'WA'),
                            currencyCode: 'USD',
                            intent: 'CHARGE')),
                        child: const Text('Verify'))))),
        WidgetbookUseCase(
            name: 'Gift Card',
            builder: (context) => PaymentBuilder(
                paymentMethodBuilder: (payments) => payments.giftCard(),
                tokenBuilder: _buildCardView)),
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

  Widget _buildCardView(PaymentCard card, void Function() tokenize) {
    // Explicitly request focus on the button to remove keyboard focus from payment input field
    // https://github.com/pelavin/square-web-payments/issues/1
    final focusNode = FocusNode();
    return Column(children: [
      CardView(card: card),
      TextButton(
          focusNode: focusNode,
          onPressed: () {
            focusNode.requestFocus();
            tokenize();
          },
          child: const Text('Tokenize'))
    ]);
  }
}
