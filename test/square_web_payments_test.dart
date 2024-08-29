import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:square_web_payments/square_web_payments.dart';

void main() {
  testWidgets('finds an HtmlElementView widget', (tester) async {
    await tester.pumpWidget(CardView(
        card: PaymentCard(
            attach: (element) => Future.error(UnimplementedError('attach')),
            destroy: () => Future.value(),
            detach: () => Future.error(UnimplementedError('detach')),
            tokenize: () => Future.error(UnimplementedError('tokenize')))));
    expect(find.byWidgetPredicate((widget) => widget is HtmlElementView),
        findsOneWidget);
  });
}
