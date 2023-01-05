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
            /// 3 method   ==> FutureBuilder //////
            List lData = [];
            snapshot.data?.docs.forEach((element) {
              lData.add(element.data());
            });

            ///3 method   ==> FutureBuilder //////

            return lData.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: lData.length,
                    itemBuilder: (BuildContext context, int i) {
                      return ListTile(
                        title: Text("name : ${lData[i]["name"]}"),
                        subtitle: Text("age : ${lData[i]["age"]}"),
                      );
                    },
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
