import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retrofit/http.dart';
import 'package:untitled/services/retrofit.dart';

class Contact extends StatelessWidget {

  const Contact({required this.id});

  // Declare a field that holds the Todo.
  final int id;


  Future<List<Photo>> fetchData() async {
    try {
      print(id);
      return await RestClient.getAPI().getPhotes(id);
    }
    catch(e) {
      await Future.delayed(Duration(seconds: 2));
      throw Exception("משהו לא טוב...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("פרטי אלבום"),
      ),
      body: Center(
        child: FutureBuilder<List<Photo>>(
            future: fetchData(),
            builder: (BuildContext context, AsyncSnapshot<List<Photo>> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              else if(snapshot.hasError){
                return Text("error - ${snapshot.error}");
              }
              else if(!(snapshot.data!.length! > 0)){
                return Text("לא נמצא מידע עבור השאילתא");
              }
              else {

                return  ListView.builder(
                    padding: const EdgeInsets.all(18),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(20.0),
                        color: Colors.white38,
                        child: InkWell(
                          child: Center(
                              child: Column(
                                children: [
                                  Text('albumId = ${snapshot.data![index].albumId}'),
                                  Text('thumbnailUrl = ${snapshot.data![index].thumbnailUrl}'),
                                  Text('Id = ${snapshot.data![index].id}'),
                                  Text('${snapshot.data![index].title}',style: (TextStyle(fontWeight: FontWeight.bold)),),
                                  Text('url = ${snapshot.data![index].url}'),
                                ],
                              )),
                          onTap: (){

                          },
                        ),
                      );
                    }
                );
              }
            }
        ),
      ),
    );
  }
}

