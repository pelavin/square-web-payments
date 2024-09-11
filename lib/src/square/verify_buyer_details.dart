import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'contact.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/ChargeVerifyBuyerDetails
/// https://developer.squareup.com/reference/sdks/web/payments/objects/StoreVerifyBuyerDetails
class VerifyBuyerDetails {
  final String amount;
  final Contact billingContact;
  final String currencyCode;
  final String intent;

  VerifyBuyerDetails(
      {required this.amount,
      required this.billingContact,
      required this.currencyCode,
      required this.intent});

  JSVerifyBuyerDetails get toJS => JSVerifyBuyerDetails(
      amount: amount.toJS,
      billingContact: billingContact.toJS,
      currencyCode: currencyCode.toJS,
      intent: intent.toJS);
}

extension type JSVerifyBuyerDetails._(JSObject _) implements JSObject {
  JSVerifyBuyerDetails(
      {required JSString amount,
      required JSContact billingContact,
      required JSString currencyCode,
      required JSString intent})
      : _ = JSObject()
          ..['amount'] = amount
          ..['billingContact'] = billingContact
          ..['currencyCode'] = currencyCode
          ..['intent'] = intent;

  external JSString get amount;
  external JSContact get billingContact;
  external JSString get currencyCode;
  external JSString get intent;
}
