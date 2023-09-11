import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retrofit/http.dart';
import 'package:untitled/services/retrofit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/staff_model.dart';
import 'contact.dart';

class ListStaff extends StatelessWidget {


  List<StaffModel> listStaff = [new StaffModel(id: 1,name: "רחל צוריאל",title: "אחות ראשית",phone: "052132157"),new StaffModel(id: 1,name: "מושיקו",title: "אחות קומה 3",phone: "0508989987")];

  List<StaffModel> fetchData() {
    return listStaff;
  }

  void openWhatsApp(String? phone) async {
    final url = 'https://wa.me/$phone';
    print(url);
      print("llllllllllllllllllllllllllllllllllllllllllllllll");
      await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text("הודעות לאנשי הצוות"),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(18),
            itemCount: listStaff.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(10.0),
                color: Colors.white38,
                child: InkWell(
                  child:     Card(
                child: ListTile(
                leading: Icon(Icons.person),
                title: Text('שם: ${listStaff[index].name}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('טלפון: ${listStaff[index].phone}',style: (TextStyle(fontWeight: FontWeight.bold))),
                    Text('תפקיד: ${listStaff[index].title}'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.chat),
                  onPressed: () {
                    openWhatsApp(listStaff[index].phone);
                  },
                ),
              ),
              )


                ),
              );
            }
        )
    );
  }
            }



