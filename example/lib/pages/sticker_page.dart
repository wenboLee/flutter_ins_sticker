import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_ins_sticker/flutter_ins_sticker.dart';

import '../sticker_element.dart';

class StickerPage extends StatefulWidget {
  final Uint8List? imageData;
  final Rect? imageRect;
  
  StickerPage({this.imageData, this.imageRect});

  @override
  _StickerPageState createState() => _StickerPageState();
}

class _StickerPageState extends State<StickerPage> {
  RuleLineElementContainerState ruleState = RuleLineElementContainerState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('贴纸'),
        actions: [
          IconButton(
            onPressed: () {
              StickerElement stickerElement = StickerElement(100, 100);
              ruleState.addSelectAndUpdateElement(stickerElement);
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              ruleState.unSelectDeleteAndUpdateTopElement();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.grey),
          constraints: BoxConstraints(
            maxHeight: widget.imageRect?.height ?? double.infinity,
            maxWidth: widget.imageRect?.width ?? double.infinity,
          ),
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              // 作为背景
              if (widget.imageData != null) Image.memory(widget.imageData!),

              Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: ElementContainerWidget(ruleState),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
