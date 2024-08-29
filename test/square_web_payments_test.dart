import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:square_web_payments/square_web_payments.dart';

void main() {
  testWidgets('finds an HtmlElementView widget', (tester) async {
    await tester.pumpWidget(PaymentView(
        paymentMethod: PaymentMethod(
            attach: (element) => Future.error(UnimplementedError),
            destroy: () => Future.error(UnimplementedError),
            detach: () => Future.error(UnimplementedError),
            tokenize: () => Future.error(UnimplementedError))));
    expect(find.byWidgetPredicate((widget) => widget is HtmlElementView),
        findsOneWidget);
  });
}
