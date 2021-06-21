import 'package:example/pages/sticker_page.dart';
import 'package:example/utils/image_util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => HomeItem(index: index),
        itemCount: 2,
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  final int index;

  HomeItem({required this.index});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return ListTile(
          leading: Icon(Icons.photo, size: 30),
          title: Text('选择图片'),
          subtitle: Text('选择图片，将图片传入作为背景'),
          onTap: () async {
            final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

            if (pickedFile != null) {
              var imageData = await pickedFile.readAsBytes();

              // 获取图片尺寸
              var rect = await ImageUtil().getImageWH(image: Image.memory(imageData));

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return StickerPage(
                      imageData: imageData,
                      imageRect: rect,
                    );
                  },
                ),
              );
            }
          },
        );
      case 1:
        return ListTile(
          title: Text('直接进入'),
        );
      case 2:
        return ListTile();
    }
    return Container();
  }
}
