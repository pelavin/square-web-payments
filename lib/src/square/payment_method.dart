import 'token_result.dart';

abstract class PaymentMethod {
  Future Function() get destroy;
  Future<TokenResult> Function() get tokenize;
}
