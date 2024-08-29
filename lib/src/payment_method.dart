import 'package:flutter/widgets.dart';

import 'interop/payment_method.dart' as interop;
import 'payment_method_view.dart';

class PaymentMethod extends StatefulWidget {
  final Future<interop.PaymentMethod> future;
  final Widget Function(PaymentMethodView? view) builder;

  const PaymentMethod({super.key, required this.future, required this.builder});

  @override
  State<StatefulWidget> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) => widget.builder(snapshot.hasData
          ? PaymentMethodView(paymentMethod: snapshot.data!)
          : null));

  @override
  void dispose() {
    super.dispose();
    widget.future.then((paymentMethod) => paymentMethod.destroy());
  }
}
