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
            //////////////// 2 method
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  title: Text("name : ${snapshot.data?.docs[i].get("name")}"),
                  subtitle: Text("age : ${snapshot.data?.docs[i]["age"]}"),
                );
              },
            );
            ////////////// 2 method
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
