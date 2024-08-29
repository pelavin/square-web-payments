import 'package:flutter/widgets.dart';

import 'interop.dart' as interop;
import 'payment_method_view.dart';

class PaymentMethod extends StatefulWidget {
  final Future<interop.PaymentMethod> future;
  final Widget placeholder;

  const PaymentMethod(
      {super.key, required this.future, required this.placeholder});

  @override
  State<StatefulWidget> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) => snapshot.hasData
          ? PaymentMethodView(paymentMethod: snapshot.data!)
          : widget.placeholder);

  @override
  void dispose() {
    super.dispose();
    widget.future.then((paymentMethod) => paymentMethod.destroy());
  }
}
