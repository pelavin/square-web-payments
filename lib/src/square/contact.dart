import 'dart:js_interop';
import 'dart:js_interop_unsafe';

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

  JSContact get toJS => JSContact(
      addressLines:
          addressLines.map((addressLine) => addressLine.toJS).toList().toJS,
      city: city?.toJS,
      countryCode: countryCode?.toJS,
      email: email?.toJS,
      familyName: familyName?.toJS,
      givenName: givenName?.toJS,
      phone: phone?.toJS,
      postalCode: postalCode?.toJS,
      state: state?.toJS);

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
  JSContact(
      {required JSArray<JSString> addressLines,
      required JSString? city,
      required JSString? countryCode,
      required JSString? email,
      required JSString? familyName,
      required JSString? givenName,
      required JSString? phone,
      required JSString? postalCode,
      required JSString? state})
      : _ = JSObject()
          ..['addressLines'] = addressLines
          ..['city'] = city
          ..['countryCode'] = countryCode
          ..['email'] = email
          ..['familyName'] = familyName
          ..['givenName'] = givenName
          ..['phone'] = phone
          ..['postalCode'] = postalCode
          ..['state'] = state;

  external JSArray<JSString> get addressLines;
  external JSString? get city;
  external JSString? get countryCode;
  external JSString? get email;
  external JSString? get familyName;
  external JSString? get givenName;
  external JSString? get phone;
  external JSString? get postalCode;
  external JSString? get state;
  Contact get toDart => Contact(
      addressLines:
          addressLines.toDart.map((addressLine) => addressLine.toDart).toList(),
      city: city?.toDart,
      countryCode: countryCode?.toDart,
      email: email?.toDart,
      familyName: familyName?.toDart,
      givenName: givenName?.toDart,
      phone: phone?.toDart,
      postalCode: postalCode?.toDart,
      state: state?.toDart);
}
