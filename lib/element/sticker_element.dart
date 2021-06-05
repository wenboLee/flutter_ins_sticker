import 'package:flutter/material.dart';

import 'decoration_element.dart';

class StickerElement extends DecorationElement {
  StickerElement(double mOriginWidth, double mOriginHeight) : super(mOriginWidth, mOriginHeight);

  @override
  Widget initWidget() {
    return Image(
      image: AssetImage('images/bg.jpg'),
      width: mOriginWidth,
      height: mOriginHeight,
      fit: BoxFit.cover,
    );
  }
}
