import 'dart:js_interop';
import 'dart:js_interop_unsafe';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/LineItem
class LineItem {
  final String amount;
  final String label;

  const LineItem({required this.amount, required this.label});

  JSLineItem get toJS => JSLineItem(amount: amount.toJS, label: label.toJS);
}

extension type JSLineItem._(JSObject _) implements JSObject {
  JSLineItem({required JSString amount, required JSString label})
      : _ = JSObject()
          ..['amount'] = amount
          ..['label'] = label;

  external JSString get amount;
  external JSString get label;
}
