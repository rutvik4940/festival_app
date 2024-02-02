import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:share_plus/share_plus.dart';

// import 'package:share_plus/share_plus.dart';

class FestivalScreen extends StatefulWidget {
  const FestivalScreen({super.key});

  @override
  State<FestivalScreen> createState() => _FestivalScreenState();
}

class _FestivalScreenState extends State<FestivalScreen> {
  bool a=false;
  bool b=false;
  bool c=false;
  bool d=false;
  bool e=false;
  bool f=false;
  String? selectvalue="all";
  TextEditingController data = TextEditingController();
  List fontstyleList = ["f1", "f2", "f3", "f4", "f5","f6"];
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
          title: const Text("Post Additing"),
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
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data is saved")));
                });
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
                 final result = await Share.shareXFiles([XFile(path)], text: 'Good picture');
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
                                    color: c1, fontSize: size, fontFamily: "font1"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DropdownButton(
                        focusColor: Colors.teal,
                        value: selectvalue,
                          items: [
                          DropdownMenuItem(child: Text("All"),value: "all"),
                          DropdownMenuItem(child: Text("Background color"),value: "background color"),
                          DropdownMenuItem(child: Text("Background image"),value: "background image"),
                          DropdownMenuItem(child: Text("Text"),value: "text"),
                          DropdownMenuItem(child: Text("Text size"),value: "text size"),
                          DropdownMenuItem(child: Text("Text color"),value: "text color"),
                          DropdownMenuItem(child: Text("Text alignment"),value: "text alignment"),
                      ],
                      onChanged: (String ? value)
                    {
                      setState(() {
                        selectvalue=value;
                        if(value=="background color")
                          {
                            a=true;
                            b=false;
                            c=false;
                            d=false;
                            e=false;
                            f=false;
                          }
                        else if(value=="background image")
                          {
                            a=false;
                            b=true;
                            c=false;
                            d=false;
                            e=false;
                            f=false;
                          }
                        else if(value=="text")
                        {
                          a=false;
                          b=false;
                          c=true;
                          d=false;
                          e=false;
                         f=false;
                        }
                        else if(value=="text size")
                        {
                          a=false;
                          b=false;
                          c=false;
                          d=true;
                          e=false;
                          f=false;
                        }
                        else if(value=="text color")
                        {
                          a=false;
                          b=false;
                          c=false;
                          d=false;
                          e=true;
                          f=false;

                        }

                        else if(value=="text alignment")
                        {
                          a=false;
                          b=false;
                          c=false;
                          d=false;
                          e=false;
                          f=true;
                        }
                        else if(value=="all")
                        {
                          a=true;
                          b=true;
                          c=true;
                          d=true;
                          e=true;
                         f=true;
                        }
                      });
                    },
                      )
                    ],
                  ),
                ),
                Divider(thickness: 2,),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.30,
                  child: ListView(scrollDirection: Axis.vertical, children: [
                    Text(
                      "Background Colors",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "f3"),
                    ),
                        Visibility(
                          visible: a,
                          child: SizedBox(
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
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        const Text(
                          "Background Image",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "f3"),
                        ),
                        Visibility(
                          visible: b,
                          child: SizedBox(
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
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Text",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "f3"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Visibility(
                            visible: c,
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
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
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
                        ),

                        const Divider(
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
                        Visibility(
                          visible: d,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: FloatingActionButton(
                                  heroTag: "1",
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
                                  heroTag: "2",
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
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        const Text(
                          "Text Color",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "f3"),
                        ),
                        Visibility(
                          visible: e,
                          child: SizedBox(
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
                        ),
                        const Divider(
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
                        Visibility(
                          visible: f,
                          child: SizedBox(
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
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                      ],
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
