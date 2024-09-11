import 'dart:js_interop';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/VerifyBuyerResponseDetails
class VerifyBuyerResponseDetails {
  final String token;
  final bool userChallenged;

  const VerifyBuyerResponseDetails(
      {required this.token, required this.userChallenged});

  Map<String, dynamic> toJson() =>
      {'token': token, 'userChallenged': userChallenged};
}

extension type JSVerifyBuyerResponseDetails._(JSObject _) implements JSObject {
  external String get token;
  external bool get userChallenged;
  VerifyBuyerResponseDetails get toDart =>
      VerifyBuyerResponseDetails(token: token, userChallenged: userChallenged);
}
