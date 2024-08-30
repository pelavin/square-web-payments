import 'error.dart';
import 'payment_method.dart';
import 'token_result.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/ApplePay
class ApplePay implements PaymentMethod {
  @override
  final Future<void> Function() destroy;
  @override
  final Future<TokenResult> Function() tokenize;

  const ApplePay({required this.destroy, required this.tokenize});
}

extension type JSApplePay._(JSPaymentMethod _) implements JSPaymentMethod {
  ApplePay get toDart => ApplePay(
      destroy: () => tryCatchToDart(() => destroy()),
      tokenize: () => tryCatchToDart(() => tokenize())
          .then((tokenResult) => tokenResult.toDart));
}
