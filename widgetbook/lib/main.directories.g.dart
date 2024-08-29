// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:square_web_payments_widgetbook/payment_method_view.dart' as _i2;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookComponent(
    name: 'PaymentMethodView',
    useCases: [
      _i1.WidgetbookUseCase(
        name: 'Card',
        builder: _i2.buildCard,
      ),
      _i1.WidgetbookUseCase(
        name: 'GiftCard',
        builder: _i2.buildGiftCard,
      ),
    ],
  )
];
