import 'token_result.dart';

abstract class Tokenizable {
  Future<TokenResult> Function() get tokenize;
}
