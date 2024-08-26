import 'dart:js_interop';

import '../models/contact.dart' as dart;

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Contact
extension type Contact._(JSObject _) implements JSObject {
  external JSArray<JSString> get addressLines;
  external String? get city;
  external String? get countryCode;
  external String? get email;
  external String? get familyName;
  external String? get givenName;
  external String? get phone;
  external String? get postalCode;
  external String? get state;
  dart.Contact get toDart => dart.Contact(
      addressLines:
          addressLines.toDart.map((addressLine) => addressLine.toDart).toList(),
      city: city,
      countryCode: countryCode,
      email: email,
      familyName: familyName,
      givenName: givenName,
      phone: phone,
      postalCode: postalCode,
      state: state);
}
