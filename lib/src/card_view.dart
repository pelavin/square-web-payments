import 'dart:js_interop';

import 'package:flutter/widgets.dart';
import 'package:web/web.dart';

import 'square/card.dart';
import 'square/error.dart';

class CardView extends StatefulWidget {
  final Card card;

  const CardView({super.key, required this.card});

  @override
  State<StatefulWidget> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  bool attaching = false;
  bool attached = false;
  double height = 1;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: height,
      child: HtmlElementView.fromTagName(
          tagName: 'div', onElementCreated: _onElementCreated));

  @override
  void dispose() {
    super.dispose();
    widget.card.destroy();
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
          widget.card
              .attach(element)
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
