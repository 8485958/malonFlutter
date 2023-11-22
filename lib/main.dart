import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/models/modules.dart';
import 'package:untitled/pages/contacts.dart';
import 'dart:io';

import 'pages/list_staff.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Module> listModules = [
    new Module(
        name: 'הודעה לאנשי הצוות', icon: Icon(Icons.chat), screen: ListStaff()),
    new Module(
        name: 'רשימת משימות', icon: Icon(Icons.task), screen: Contacts()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 3, 61),
        title: Center(
            child: Text("מלון סיעודי שלמה המלך",
                style: (TextStyle(
                    color: Color(0xfff6f2f2), fontWeight: FontWeight.bold)))),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/backgroundlogo.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
          )),
          child: Column(
            children: [
              Image.asset(
                "assets/imglogo.png",
                width: 200,
                height: 180,
              ),
              SizedBox(
                height: 300,
              ),
              SizedBox(
                height: 280.0,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: listModules.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 80,
                        color: Colors.white70,
                        child: Center(
                            child: TextButton(
                                onPressed: () {
                                  Get.to(listModules[index].screen);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Center(child: listModules[index].icon),
                                    Text(
                                      '${listModules[index].name}',
                                      style: (TextStyle(
                                          fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ))),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
