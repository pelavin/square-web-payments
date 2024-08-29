import 'package:flutter/widgets.dart';
import 'package:square_web_payments/square_web_payments.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CardPayment)
Widget build(BuildContext context) => const CardPayment(
    applicationId: 'sandbox-sq0idb-negdp6Z5Q7RYeFbAv38m0A',
    locationId: 'L6XCYJM4ZPHRP',
    placeholder: Text('Initializing...'));
