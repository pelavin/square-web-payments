/// https://developer.squareup.com/reference/sdks/web/payments/objects/TokenErrorDetails
class TokenErrorDetails {
  final String field;
  final String message;
  final String type;

  const TokenErrorDetails(
      {required this.field, required this.message, required this.type});

  Map<String, dynamic> toJson() =>
      {'field': field, 'message': message, 'type': type};
}
