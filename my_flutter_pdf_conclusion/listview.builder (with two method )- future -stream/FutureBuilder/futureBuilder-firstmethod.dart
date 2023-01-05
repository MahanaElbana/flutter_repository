import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Gui extends StatefulWidget {
  @override
  _GuiState createState() => _GuiState();
}

class _GuiState extends State<Gui> {
  
  ////////  firist method ==> FutureBuilder

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("user");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      
      body: FutureBuilder(
        future: collectionReference.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            // List lData = [];
            // snapshot.data?.docs.forEach((element) {});
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("name : ${snapshot.data?.docs[index]["name"]}"),
                  subtitle:
                      Text("age : ${snapshot.data?.docs[index].get("age")}"),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: LinearProgressIndicator(),
            );
          }
        },
      ),
      
    );
  }
}
