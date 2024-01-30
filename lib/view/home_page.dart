// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_task/view/Api1_call.dart';
import 'package:json_task/view/Api_Call.dart';
import 'package:json_task/view/second_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? jsonDecodeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return FatchData1();
                },
              ));
            },
            icon: Icon(Icons.ac_unit_sharp)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return FatchData();
                  },
                ));
              },
              icon: Icon(Icons.api))
        ],
        title: Text("Json Demo"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Student 1  = ${jsonDecodeData?["name"] ?? ""}',
            ),
            Expanded(
                child: ListView.builder(
              itemCount: (jsonDecodeData?["sub"] as List?)?.length ?? 0,
              itemBuilder: (context, index) {
                var list = (jsonDecodeData!["sub"] as List)
                    .map((e) => e as Map<String, dynamic>)
                    .toList();
                var cl =
                    (list[index]["chap"] as List).map((e) => "$e").toList();
                return ListTile(
                  title: Text("${list[index]["sub_name"]}"),
                  trailing: Text("${list[index]["mark"]}"),
                  subtitle: Wrap(
                    children:
                        cl.map((e) => ActionChip(label: Text(e))).toList(),
                  ),
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String data =
              "{\"name\":\"S1\",\"sub\":[{\"sub_name\":\"Flutter\",\"mark\":10,\"chap\":[\"c1\",\"c2\",\"chap11\",\"chap88\"]},{\"sub_name\":\"c\",\"mark\":8,\"chap\":[\"c8\",\"c6\",\"ch11\"]},{\"sub_name\":\"c++\",\"mark\":8,\"chap\":[\"c8\",\"c2\"]}]}";
          jsonDecodeData = jsonDecode(data);
          setState(() {});

          //When You Want to get Data From Json File
          // var fileData=await rootBundle.loadString("assets/sample.json");
          // jsonDecode(fileData);
          // print("File Data==> $fileData");

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Second()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
