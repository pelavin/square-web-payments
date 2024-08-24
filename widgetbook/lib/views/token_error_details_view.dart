import 'package:flutter/widgets.dart';
import 'package:square_web_payments/square_web_payments.dart';

import 'object_view.dart';

class TokenErrorDetailsView extends StatelessWidget {
  final TokenErrorDetails tokenErrorDetails;

  const TokenErrorDetailsView({super.key, required this.tokenErrorDetails});

  @override
  Widget build(BuildContext context) =>
      ObjectView(name: 'TokenErrorDetails', propertyNameWidth: 60, properties: [
        Property(name: 'field', widget: Text(tokenErrorDetails.field)),
        Property(name: 'message', widget: Text(tokenErrorDetails.message)),
        Property(name: 'type', widget: Text(tokenErrorDetails.type))
      ]);
}
