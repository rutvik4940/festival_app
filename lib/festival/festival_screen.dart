import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class FestivalScreen extends StatefulWidget {
  const FestivalScreen({super.key});

  @override
  State<FestivalScreen> createState() => _FestivalScreenState();
}

class _FestivalScreenState extends State<FestivalScreen> {
  TextEditingController data = TextEditingController();
  List fontstyleList = ["f1", "f2", "f3", "f4", "f5"];
  String font1 = "f1";
  Alignment selectvelue = Alignment.bottomRight;
  double size = 20;
  Color c1 = Colors.white;
  String text = "";
  List bgimageList = [];
  Color bgcolor = Colors.transparent;
  List color = [Colors.black, Colors.white, ...Colors.primaries];
  String bgimage = "assets/logo/logo1.png";
  GlobalKey data1 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    bgimageList = ModalRoute.of(context)!.settings.arguments as List;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                RenderRepaintBoundary data3 = data1.currentContext!
                    .findRenderObject() as RenderRepaintBoundary;
                ui.Image image = await data3.toImage();
                ByteData? byteData =
                    await image.toByteData(format: ui.ImageByteFormat.png);
                String path = "/storage/emulated/0/Download/rutvik.png";
                await File(path).writeAsBytes(byteData!.buffer.asUint8List());
                print("$path");
              },
              icon: const Icon(Icons.save),
            ),
            IconButton(
              onPressed: () async {
                RenderRepaintBoundary data3 = data1.currentContext!
                    .findRenderObject() as RenderRepaintBoundary;
                ui.Image image = await data3.toImage();
                ByteData? byteData =
                await image.toByteData(format: ui.ImageByteFormat.png);
                String path = "/storage/emulated/0/Download/rutvik.png";
                await File(path).writeAsBytes(byteData!.buffer.asUint8List());
                print("$path");

              },
              icon: const Icon(Icons.share),
            ),

          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RepaintBoundary(
                  key: data1,
                  child: Stack(
                    children: [
                      Image.asset(bgimage,
                          height: MediaQuery.sizeOf(context).height * 0.50,
                          width: MediaQuery.sizeOf(context).width,
                          fit: BoxFit.fill),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.50,
                        width: MediaQuery.sizeOf(context).width,
                        color: bgcolor,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: selectvelue,
                              child: Text(
                                text,
                                style: TextStyle(
                                    color: c1,
                                    fontSize: size,
                                    fontFamily: "f1"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Background Colors",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "f3"),
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: color.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          bgcolor = color[index];
                        });
                      },
                      child: Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color[index],
                          )),
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                const Text(
                  "Background Image",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "f3"),
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bgimageList.length,
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            bgcolor = Colors.transparent;
                            bgimage = bgimageList[index];
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "${bgimageList[index]}",
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Text",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: "f3")),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        controller: data,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                            hintText: "Enter your Message ....."),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.teal)),
                        onPressed: () {
                          setState(() {
                            text = data.text;
                            data.clear();
                          });
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                const Text(
                  "Text Size",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "f3"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            size = size + 5;
                          });
                        },
                        child: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("$size"),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            size = size - 5;
                          });
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 2,
                ),
                const Text(
                  "Text Color",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "f3"),
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: color.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          c1 = color[index];
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color[index],
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                const Text(
                  "Text Alignment",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "f3"),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectvelue = Alignment.center;
                          });
                        },
                        child: const Column(
                          children: [
                            Icon(Icons.align_horizontal_center),
                            Text("Center"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectvelue = Alignment.centerLeft;
                          });
                        },
                        child: const Column(
                          children: [
                            Icon(Icons.align_horizontal_left),
                            Text("Center left"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectvelue = Alignment.centerRight;
                          });
                        },
                        child: const Column(
                          children: [
                            Icon(Icons.align_horizontal_right),
                            Text("Center Right"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectvelue = Alignment.topLeft;
                          });
                        },
                        child: const Column(
                          children: [
                            Icon(Icons.align_horizontal_left),
                            Text("Top left"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectvelue = Alignment.topCenter;
                          });
                        },
                        child: const Column(
                          children: [
                            Icon(Icons.align_horizontal_center),
                            Text("Top Center"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectvelue = Alignment.topRight;
                          });
                        },
                        child: const Column(
                          children: [
                            Icon(Icons.align_horizontal_right),
                            Text("Top Right"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectvelue = Alignment.bottomLeft;
                          });
                        },
                        child: const Column(
                          children: [
                            Icon(Icons.align_horizontal_left),
                            Text("Bottom left"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectvelue = Alignment.bottomCenter;
                          });
                        },
                        child: const Column(
                          children: [
                            Icon(Icons.align_horizontal_center),
                            Text("Bottom Center"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectvelue = Alignment.bottomRight;
                          });
                        },
                        child: const Column(
                          children: [
                            Icon(Icons.align_horizontal_right),
                            Text("Bottom Right"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                const Text(
                  "Font Style",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "f3"),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fontstyleList.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        font1 = fontstyleList[index];
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Font",
                              style: TextStyle(
                                  fontFamily: fontstyleList[index],
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
