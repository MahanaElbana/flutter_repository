import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Gui extends StatefulWidget {
  @override
  _GuiState createState() => _GuiState();
}

class _GuiState extends State<Gui> {
  ////////  first method ==> FutureBuilder

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
            /// first  method   ==> FutureBuilder //////
            List lData = [];
            snapshot.data?.docs.forEach((element) {
              lData.add(element.data());
            });

            ///first method   ==> FutureBuilder //////

            return lData.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children: lData.map((element) {
                      return ListTile(
                        title: Text("name : ${element["name"]}"),
                        subtitle: Text("age : ${element["age"]}"),
                      );
                    }).toList(),
                  );
            ////////////// first method
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
