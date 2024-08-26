import '../interop/square.dart' as interop;
import 'payments.dart';

/// https://developer.squareup.com/reference/sdks/web/payments/objects/Square
class Square {
  static Payments payments(String applicationId, String locationId) =>
      interop.square.payments(applicationId, locationId).toDart;
}
