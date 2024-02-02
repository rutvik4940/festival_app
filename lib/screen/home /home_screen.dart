import 'package:festival/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              Image.asset("assets/logo/HD-wallpaper-plain-white-abstract.jpg",
                  height: MediaQuery.sizeOf(context).height ,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.fill),
            SingleChildScrollView(
                    child: Column(
            children: [
              const Text("FESTIVALS",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "sumit")),
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView.builder(
                  itemCount: festivalList.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'festival',
                          arguments: image[index]);
                    },
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.primaries[index].shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage("${festivalList[index]['image']}")),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${festivalList[index]['name']}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "f3"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
                    ),
                  ),
    ]
          ),
    ),
    );
  }
}
