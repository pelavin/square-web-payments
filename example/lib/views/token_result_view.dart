import 'dart:js_interop';

import 'package:flutter/widgets.dart';
import 'package:square_web_payments/square_web_payments.dart';

import 'object_view.dart';
import 'token_details_view.dart';
import 'token_error_details_view.dart';

class TokenResultView extends StatelessWidget {
  final TokenResult tokenResult;

  const TokenResultView({super.key, required this.tokenResult});

  @override
  Widget build(BuildContext context) =>
      ObjectView(name: 'TokenResult', propertyNameWidth: 50, properties: [
        Property(name: 'status', widget: Text(tokenResult.status)),
        ...(tokenResult.details == null
            ? []
            : [
                Property(
                    name: 'details',
                    widget:
                        TokenDetailsView(tokenDetails: tokenResult.details!))
              ]),
        ...(tokenResult.errors == null
            ? []
            : [
                Property(
                    name: 'errors',
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: tokenResult.errors!.toDart
                            .map((error) =>
                                TokenErrorDetailsView(tokenErrorDetails: error))
                            .toList()))
              ]),
        ...(tokenResult.token == null
            ? []
            : [Property(name: 'token', widget: Text(tokenResult.token!))])
      ]);
}
