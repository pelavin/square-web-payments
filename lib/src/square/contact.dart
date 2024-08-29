import 'dart:js_interop';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Contact
class Contact {
  final List<String> addressLines;
  final String? city;
  final String? countryCode;
  final String? email;
  final String? familyName;
  final String? givenName;
  final String? phone;
  final String? postalCode;
  final String? state;

  const Contact(
      {required this.addressLines,
      required this.city,
      required this.countryCode,
      required this.email,
      required this.familyName,
      required this.givenName,
      required this.phone,
      required this.postalCode,
      required this.state});

  Map<String, dynamic> toJson() => {
        'addressLines': addressLines,
        ...(city == null ? {} : {'city': city}),
        ...(countryCode == null ? {} : {'countryCode': countryCode}),
        ...(email == null ? {} : {'email': email}),
        ...(familyName == null ? {} : {'familyName': familyName}),
        ...(givenName == null ? {} : {'givenName': givenName}),
        ...(phone == null ? {} : {'phone': phone}),
        ...(postalCode == null ? {} : {'postalCode': postalCode}),
        ...(state == null ? {} : {'state': state})
      };
}

extension type JSContact._(JSObject _) implements JSObject {
  external JSArray<JSString> get addressLines;
  external String? get city;
  external String? get countryCode;
  external String? get email;
  external String? get familyName;
  external String? get givenName;
  external String? get phone;
  external String? get postalCode;
  external String? get state;
  Contact get toDart => Contact(
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
