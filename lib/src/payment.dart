import 'package:flutter/widgets.dart';

import 'models/payment_method.dart';
import 'payment_view.dart';

class Payment extends StatefulWidget {
  final Future<PaymentMethod> future;
  final Widget Function(PaymentView? view) builder;

  const Payment({super.key, required this.future, required this.builder});

  @override
  State<StatefulWidget> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) => widget.builder(snapshot.hasData
          ? PaymentView(paymentMethod: snapshot.data!)
          : null));

  @override
  void dispose() {
    super.dispose();
    widget.future.then((paymentMethod) => paymentMethod.destroy());
  }
}
