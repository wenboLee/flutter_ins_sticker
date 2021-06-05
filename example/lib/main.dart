import 'package:flutter/material.dart';
import 'package:flutter_ins_sticker/flutter_ins_sticker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RuleLineElementContainerState decorationElementContainerWidgetState = RuleLineElementContainerState();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey
            ),
            child: ElementContainerWidget(
                decorationElementContainerWidgetState),
          ),
          Positioned(
            child: TextButton(
              child: Text("add"),
              onPressed: () {
                StickerElement stickerElement = StickerElement(100, 100);
                decorationElementContainerWidgetState
                    .addSelectAndUpdateElement(
                    stickerElement);
              },
            ),
            left: 0,
            top: 50,
          ),
          Positioned(
            child: TextButton(
              child: Text("delete"),
              onPressed: () {
                decorationElementContainerWidgetState
                    .unSelectDeleteAndUpdateTopElement();
              },
            ),
            left: 100,
            top: 50,
          ),
        ],
      ),
    );
  }
}

