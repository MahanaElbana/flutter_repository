import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Gui extends StatefulWidget {
  @override
  _GuiState createState() => _GuiState();
}

class _GuiState extends State<Gui> {
  ////////  second method ==> FutureBuilder

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("user");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: collectionReference.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            ///
            /* List lData = [];
            snapshot.data?.docs.forEach((element) {
              lData.add(element.data());
            });*/

            ///
            return ListView(
              //////// 4 method   ==> FutureBuilder //////
              children: snapshot.data!.docs.map((e) {
                Map<String, dynamic> data = e.data() as Map<String, dynamic>;

                return ListTile(
                  title: Text("name : ${data["name"]}"),
                  subtitle: Text("age : ${data["age"]}"),
                );
              }).toList(),
              ///////// 4 method   ==> FutureBuilder ////
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Text("Loading ----"),
          );
        },
      ),
    );
  }
}
