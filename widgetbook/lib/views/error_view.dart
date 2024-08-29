import 'package:flutter/widgets.dart';
import 'package:square_web_payments/square_web_payments.dart';

import 'object_view.dart';

class ErrorView extends StatelessWidget {
  final Error error;

  const ErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) =>
      ObjectView(name: 'Error', propertyNameWidth: 60, properties: [
        Property(name: 'name', widget: Text(error.name)),
        Property(name: 'message', widget: Text(error.message))
      ]);
}
