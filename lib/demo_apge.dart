import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:widgets_to_image/widgets_to_image.dart';


class Demo_Page extends StatefulWidget {
  const Demo_Page({super.key});

  @override
  State<Demo_Page> createState() => _Demo_PageState();
}

class _Demo_PageState extends State<Demo_Page> {
  // WidgetsToImageController to access widget
  WidgetsToImageController controller = WidgetsToImageController();
  // to save image bytes of widget
  Uint8List? bytes;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Widgets To Image'),
      centerTitle: true,
    ),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "Widgets",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        WidgetsToImage(
          controller: controller,
          child: cardWidget(),
        ),
        const Text(
          "Images",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        if (bytes != null) buildImage(bytes!),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.image_outlined),
      onPressed: () async {
        final bytes = await controller.capture();
        setState(() {
          this.bytes = bytes;
        });
      },
    ),
  );

  Widget cardWidget() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(16),
            ),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.pinkAccent,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Title",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
}
