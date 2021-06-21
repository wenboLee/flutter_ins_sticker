import 'package:flutter/material.dart';
import 'package:flutter_ins_sticker/flutter_ins_sticker.dart';


class StickerElement extends DecorationElement {
  StickerElement(double mOriginWidth, double mOriginHeight) : super(mOriginWidth, mOriginHeight);

  @override
  Widget initWidget() {
    return Image(
      image: AssetImage('assets/images/bg.jpg'),
      width: mOriginWidth,
      height: mOriginHeight,
      fit: BoxFit.cover,
    );
  }
}
