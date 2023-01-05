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
      body: FutureBuilder(
        future: collectionReference.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            ///////////////  method   ==> FutureBuilder ////
            List lData = [];
            snapshot.data?.docs.forEach((element) {
              lData.add(element.data());
            });
            ///////////  method   ==> FutureBuilder //////
            return lData.isEmpty
                ? Center(
                    child: Text("Loading..."),
                  )
                : ListView.builder(
                    itemCount: lData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("name : ${lData[index]["name"]}"),
                        subtitle: Text("age : ${lData[index]["age"]}"),
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
