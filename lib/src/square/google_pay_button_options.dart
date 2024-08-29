import 'dart:js_interop';

import 'line_item.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/GooglePayButtonOptions
@JSExport()
class GooglePayButtonOptions {
  @JSExport()
  final String? buttonColor;
  @JSExport()
  final String? buttonSizeMode;
  @JSExport()
  final String? buttonType;

  const GooglePayButtonOptions(
      {this.buttonColor, this.buttonSizeMode, this.buttonType});
}

extension type JSGooglePayButtonOptions._(JSObject _) implements JSObject {
  external String get buttonColor;
  external String get buttonSizeMode;
  external JSLineItem get buttonType;
}
