import 'dart:js_interop';

import 'token_details.dart';
import 'token_error_details.dart';
import '../models/token_result.dart' as dart;

/// https://developer.squareup.com/reference/sdks/web/payments/objects/TokenResult
extension type TokenResult._(JSObject _) implements JSObject {
  external TokenDetails? get details;
  external JSArray<TokenErrorDetails>? get errors;
  external String get status;
  external String? get token;
  dart.TokenResult get toDart => dart.TokenResult(
      details: details?.toDart,
      errors: errors?.toDart.map((error) => error.toDart).toList(),
      status: status,
      token: token);
}
