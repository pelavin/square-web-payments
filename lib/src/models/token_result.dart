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
