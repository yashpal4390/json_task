// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Modal/modal1.dart';

class FatchData1 extends StatefulWidget {
  const FatchData1({super.key});

  @override
  State<FatchData1> createState() => _FatchData1State();
}

class _FatchData1State extends State<FatchData1> {
  List<Sample> apiList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Api of Get"),
      ),
      body: ListView.builder(
        itemCount: apiList.length,
        itemBuilder: (context, index) {
          var sample = apiList[index];
          return Container(
            color: Colors.greenAccent,
            height: 330,
            padding: EdgeInsetsDirectional.all(8),
            margin: EdgeInsetsDirectional.all(8),
            child: Column(
              children: [
                Text("User ID :~ ${sample.userId}", style: TextStyle(fontSize: 18)),
                Text("Id :~ ${sample.id}", style: TextStyle(fontSize: 18)),
                Text("Title :~ ${sample.title}", style: TextStyle(fontSize: 18)),
                Text("Body :~ ${sample.body}", style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        var future = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
        apiList = sampleFromJson(future.body);
        setState(() {
        });
      }),
    );
  }
}
