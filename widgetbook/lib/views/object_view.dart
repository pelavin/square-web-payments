import 'package:flutter/widgets.dart';

class Property {
  final String name;
  final Widget widget;

  const Property({required this.name, required this.widget});
}

class ObjectView extends StatelessWidget {
  final String name;
  final double propertyNameWidth;
  final List<Property> properties;

  const ObjectView(
      {super.key,
      required this.name,
      required this.propertyNameWidth,
      required this.properties});

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(name, style: const TextStyle(fontStyle: FontStyle.italic)),
        ...properties.map((property) =>
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                  width: propertyNameWidth,
                  child: Text(property.name, softWrap: false)),
              const SizedBox(width: 6),
              Flexible(child: property.widget),
            ]))
      ]);
}
