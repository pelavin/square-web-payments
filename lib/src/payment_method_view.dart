import 'dart:js_interop';

import 'package:flutter/widgets.dart';
import 'package:web/web.dart';

import 'square/payment_method.dart';

class PaymentMethodView extends StatefulWidget {
  final PaymentMethod paymentMethod;
  final void Function(HTMLDivElement element) onElementCreated;

  const PaymentMethodView(
      {super.key, required this.paymentMethod, required this.onElementCreated});

  @override
  State<StatefulWidget> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  bool created = false;
  double height = 1;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: height,
      child: HtmlElementView.fromTagName(
          tagName: 'div', onElementCreated: _onElementCreated));

  @override
  void dispose() {
    super.dispose();
    widget.paymentMethod.destroy();
  }

  void _onElementCreated(Object element) {
    element as HTMLDivElement;
    element.style.height = 'initial';
    final ResizeObserver observer = ResizeObserver((
      JSArray<ResizeObserverEntry> entries,
      ResizeObserver observer,
    ) {
      if (element.isConnected) {
        if (!created) {
          setState(() => created = true);
          widget.onElementCreated(element);
        }

        final contentHeight = entries.toDart.first.contentRect.height;
        if (contentHeight > 0 && contentHeight != height) {
          setState(() => height = contentHeight);
        }
      }
    }.toJS);
    observer.observe(element);
  }
}
