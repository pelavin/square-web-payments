import 'dart:js_interop';
import 'dart:js_interop_unsafe';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/GooglePayButtonOptions
class GooglePayButtonOptions {
  final String? buttonColor;
  final String? buttonSizeMode;
  final String? buttonType;

  const GooglePayButtonOptions(
      {this.buttonColor, this.buttonSizeMode, this.buttonType});

  JSGooglePayButtonOptions get toJS => JSGooglePayButtonOptions(
      buttonColor: buttonColor?.toJS,
      buttonSizeMode: buttonSizeMode?.toJS,
      buttonType: buttonType?.toJS);
}

extension type JSGooglePayButtonOptions._(JSObject _) implements JSObject {
  JSGooglePayButtonOptions(
      {required JSString? buttonColor,
      required JSString? buttonSizeMode,
      required JSString? buttonType})
      : _ = JSObject()
          ..['buttonColor'] = buttonColor
          ..['buttonSizeMode'] = buttonSizeMode
          ..['buttonType'] = buttonType;

  external JSString? get buttonColor;
  external JSString? get buttonSizeMode;
  external JSString? get buttonType;
}
