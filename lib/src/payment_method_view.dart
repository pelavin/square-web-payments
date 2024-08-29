import 'dart:js_interop';

import 'package:flutter/widgets.dart';
import 'package:web/web.dart';

import 'square/payment_method.dart';

/// Renders the view associated with the attached payment method.
class PaymentMethodView extends StatefulWidget {
  /// The [PaymentMethod] attached to this view.
  final PaymentMethod paymentMethod;

  /// Called when the DOM element is attached.
  final void Function(HTMLDivElement element) onElementAttached;

  /// Creates a [PaymentMethodView].
  const PaymentMethodView(
      {super.key,
      required this.paymentMethod,
      required this.onElementAttached});

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
          widget.onElementAttached(element);
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
