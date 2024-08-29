import 'dart:js_interop';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:square_web_payments/square_web_payments.dart';

@JSExport()
class FakePaymentMethod {
  String get id => 'fake_id';
}

void main() {
  final PaymentMethod paymentMethod =
      createJSInteropWrapper<FakePaymentMethod>(FakePaymentMethod())
          as PaymentMethod;

  testWidgets('finds an HtmlElementView widget', (tester) async {
    await tester.pumpWidget(PaymentMethodView(paymentMethod: paymentMethod));
    expect(find.byWidgetPredicate((widget) => widget is HtmlElementView),
        findsOneWidget);
  });
}
