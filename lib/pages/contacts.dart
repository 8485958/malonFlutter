import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:retrofit/http.dart';
import 'package:untitled/services/retrofit.dart';

import 'contact.dart';

class Contacts extends StatelessWidget {
  Future<List<Task>> fetchData() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      return await RestClient.getAPI().getTasks();
    } catch (e) {
      await Future.delayed(Duration(seconds: 2));
      throw Exception("משהו לא טוב...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("רשימת משתמשים"),
      ),
      body: Center(
        child: FutureBuilder<List<Task>>(
            future: fetchData(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Lottie.asset('assets/loading.json');
              } else if (snapshot.hasError) {
                return Text("error - ${snapshot.error}");
              } else {
                return ListView.builder(
                    padding: const EdgeInsets.all(18),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(20.0),
                        padding: EdgeInsets.only(left: 12.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(255, 192, 217, 228)),
                        child: InkWell(
                          child: Center(
                              child: Column(
                            children: [
                              Text('user Id = ${snapshot.data![index].userId}'),
                              Text('Id = ${snapshot.data![index].id}'),
                              Text(
                                '${snapshot.data![index].title}',
                                style: (TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Text(
                                  'Completed = ${snapshot.data![index].completed}'),
                              Text(
                                'בחר מזהה ושלוף אלבומים לפיו',
                                style: (TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          )),
                          onTap: () {
                            Get.to(Contact(id: snapshot.data![index].id!));
                          },
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
