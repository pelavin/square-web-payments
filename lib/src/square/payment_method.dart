import 'token_result.dart';

abstract class PaymentMethod {
  Future<TokenResult> Function() get tokenize;
}
