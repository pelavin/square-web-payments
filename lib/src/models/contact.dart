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
