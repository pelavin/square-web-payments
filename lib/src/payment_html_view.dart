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
  late FocusNode _focusNode;
  late HTMLElement _unfocusHtmlElement;
  bool _iframeFocused = false;
  bool _attached = false;
  double _height = 1;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() async {
      if (_iframeFocused && !_focusNode.hasFocus) {
        await Future.delayed(Duration.zero);
        _unfocusHtmlElement.focus();
      }
    });
    _unfocusHtmlElement = HTMLInputElement()
      ..className = 'unfocus'
      ..style.border = '0'
      ..style.height = '0'
      ..style.padding = '0'
      ..style.position = 'absolute'
      ..style.width = '0';
  }

  @override
  Widget build(BuildContext context) => Focus(
      focusNode: _focusNode,
      child: SizedBox(
          height: _height,
          child: HtmlElementView.fromTagName(
              tagName: 'div', onElementCreated: _onElementCreated)));

  @override
  void dispose() {
    if (_attached && widget.onElementDetached != null) {
      widget.onElementDetached!();
    }
    _focusNode.dispose();
    super.dispose();
  }

  void _onElementCreated(Object element) {
    element as HTMLDivElement;
    element.style.height = 'initial';
    element.appendChild(_unfocusHtmlElement);
    _observeChildList(element);
    _observeResize(element);
  }

  void _observeChildList(HTMLDivElement element) => MutationObserver(
              (JSArray<MutationRecord> records, MutationObserver observer) {
        for (MutationRecord record in records.toDart) {
          for (int i = 0; i < record.addedNodes.length; i++) {
            HTMLDivElement childElement =
                record.addedNodes.item(i) as HTMLDivElement;
            _observeFocusClass(childElement);
          }
        }
      }.toJS)
          .observe(element, MutationObserverInit(childList: true));

  void _observeFocusClass(HTMLDivElement element) => MutationObserver(
              (JSArray<MutationRecord> records, MutationObserver observer) {
        final iframeFocused = element.classList.contains('sq-focus');
        if (!_focusNode.hasFocus && !_iframeFocused && iframeFocused) {
          _focusNode.requestFocus();
        }
        setState(() => _iframeFocused = iframeFocused);
      }.toJS)
          .observe(
              element,
              MutationObserverInit(
                  attributes: true,
                  attributeFilter: ['class'] as JSArray<JSString>));

  void _observeResize(HTMLDivElement element) => ResizeObserver(
              (JSArray<ResizeObserverEntry> entries, ResizeObserver observer) {
        if (element.isConnected) {
          if (!_attached) {
            setState(() => _attached = true);
            widget.onElementAttached(element);
          }

          final contentHeight = entries.toDart.first.contentRect.height;
          if (contentHeight > 0 && contentHeight != _height) {
            setState(() => _height = contentHeight);
          }
        }
      }.toJS)
          .observe(element);
}
