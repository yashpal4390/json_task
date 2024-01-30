// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Modal/second_modal.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  List<Comment> secondList = [];

  @override
  void initState() {
    fatchData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Api of Get"),
      ),
      body: (secondList.isEmpty)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: secondList.length,
              itemBuilder: (context, index) {
                var sample = secondList[index];
                return Container(
                  color: Colors.greenAccent,
                  height: 330,
                  padding: EdgeInsetsDirectional.all(8),
                  margin: EdgeInsetsDirectional.all(8),
                  child: Column(
                    children: [
                      Text("E-Mail ID :~ ${sample.email}",
                          style: TextStyle(fontSize: 18)),
                      Text("Id :~ ${sample.id}",
                          style: TextStyle(fontSize: 18)),
                      Text("Title :~ ${sample.name}",
                          style: TextStyle(fontSize: 18)),
                      Text("Body :~ ${sample.body}",
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(onPressed: () async {}),
    );
  }

  Future<void> fatchData() async {
    var future = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/comments?postId=1"));
    secondList = commentFromJson(future.body);
    setState(() {});
  }
}
