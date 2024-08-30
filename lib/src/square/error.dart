import 'dart:js_interop';

/// https://developer.squareup.com/reference/sdks/web/payments/errors
class Error {
  final String name;
  final String message;
  final String? stack;

  const Error({required this.name, required this.message, required this.stack});

  Map<String, dynamic> toJson() => {
        'name': name,
        'message': message,
        ...(stack == null ? {} : {'stack': stack})
      };

  @override
  String toString() => '$name: $message${stack == null ? '' : '\n$stack'}';
}

extension type JSError._(JSObject _) implements JSObject {
  external String get name;
  external String get message;
  external String? get stack;
  Error get toDart => Error(name: name, message: message, stack: stack);
}

extension ErrorHandlers<T> on Future<T> {
  /// The payment method views will detach the associated payment method object
  /// when disposing, but this can occur after the payment object has already
  /// been destroyed in higher-level code, so we can ignore this error when
  /// detaching.
  Future<T> ignorePaymentMethodAlreadyDestroyedError([T? defaultValue]) =>
      catchError((error) => defaultValue,
          test: (error) =>
              (error as Error).name == 'PaymentMethodAlreadyDestroyedError');
}

/// SDK functions can throw before returning the JSPromise object,
/// so we wrap all async SDK calls with try/catch and async/await to
/// catch errors from both sync and async code.
Future<T> tryCatchToDart<T extends JSAny?>(
    JSPromise<T> Function() function) async {
  try {
    return await function().toDart;
  } catch (error) {
    throw (error as JSError).toDart;
  }
}
