import 'dart:js_interop';

import 'token_details.dart';
import 'token_error_details.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/TokenResult
class TokenResult {
  final TokenDetails? details;
  final List<TokenErrorDetails>? errors;
  final String status;
  final String? token;

  const TokenResult(
      {required this.details,
      required this.errors,
      required this.status,
      required this.token});

  Map<String, dynamic> toJson() => {
        ...(details == null ? {} : {'details': details}),
        ...(errors == null ? {} : {'errors': errors}),
        'status': status,
        ...(token == null ? {} : {'token': token})
      };
}

extension type JSTokenResult._(JSObject _) implements JSObject {
  external JSTokenDetails? get details;
  external JSArray<JSTokenErrorDetails>? get errors;
  external String get status;
  external String? get token;
  TokenResult get toDart => TokenResult(
      details: details?.toDart,
      errors: errors?.toDart.map((error) => error.toDart).toList(),
      status: status,
      token: token);
}
