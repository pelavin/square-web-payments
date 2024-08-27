import 'dart:js_interop';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/LineItem
@JSExport()
class LineItem {
  @JSExport()
  final String amount;
  @JSExport()
  final String label;

  const LineItem({required this.amount, required this.label});
}

extension type JSLineItem._(JSObject _) implements JSObject {
  external String get amount;
  external String get label;
}
