import 'dart:js_interop';

import 'package:flutter/widgets.dart';
import 'package:web/web.dart';

import 'interop/error.dart' as interop;
import 'interop/payment_method.dart' as interop;

import 'models/token_result.dart';
import 'models/error.dart';

class PaymentView extends StatefulWidget {
  final interop.PaymentMethod paymentMethod;

  const PaymentView({super.key, required this.paymentMethod});

  @override
  State<StatefulWidget> createState() => _PaymentViewState();

  Future<TokenResult> tokenize() =>
      paymentMethod.tokenize().toDart.then((tokenResult) => tokenResult.toDart,
          onError: (error) => throw (error as interop.Error).toDart);
}

class _PaymentViewState extends State<PaymentView> {
  bool attaching = false;
  bool attached = false;
  double height = 1;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: height,
      child: HtmlElementView.fromTagName(
          tagName: 'div', onElementCreated: _onElementCreated));

  @override
  void dispose() async {
    super.dispose();
    if (attached) {
      try {
        await widget.paymentMethod.detach().toDart;
      } catch (error) {
        error as Error;
        if (error.name != 'PaymentMethodAlreadyDestroyedError') {
          rethrow;
        }
      }
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
        if (!attaching && !attached) {
          setState(() => attaching = true);
          widget.paymentMethod
              .attach(element)
              .toDart
              .catchError((error) => throw error as Error)
              .then((_) => setState(() => attached = true))
              .whenComplete(() => setState(() => attaching = false));
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
