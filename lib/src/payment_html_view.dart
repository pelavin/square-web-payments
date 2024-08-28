import 'dart:js_interop';

import 'package:flutter/widgets.dart';
import 'package:web/web.dart';

/// Renders the HTML attached to a given payment method.
class PaymentHtmlView extends StatefulWidget {
  /// Called when the DOM element is attached.
  final void Function(HTMLDivElement element) onElementAttached;

  /// Called when this object is removed from the tree permanently.
  final void Function()? onElementDetached;

  /// Creates a [PaymentHtmlView].
  const PaymentHtmlView(
      {super.key, required this.onElementAttached, this.onElementDetached});

  @override
  State<StatefulWidget> createState() => _PaymentHtmlViewState();
}

class _PaymentHtmlViewState extends State<PaymentHtmlView> {
  bool attached = false;
  double height = 1;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: height,
      child: HtmlElementView.fromTagName(
          tagName: 'div', onElementCreated: _onElementCreated));

  @override
  void dispose() {
    super.dispose();
    if (attached && widget.onElementDetached != null) {
      widget.onElementDetached!();
    }
  }

  void _onElementCreated(Object element) {
    element as HTMLDivElement;
    element.style.height = 'initial';
    final ResizeObserver observer = ResizeObserver((
      JSArray<ResizeObserverEntry> entries,
      ResizeObserver observer,
    ) {
      if (element.isConnected) {
        if (!attached) {
          setState(() => attached = true);
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
