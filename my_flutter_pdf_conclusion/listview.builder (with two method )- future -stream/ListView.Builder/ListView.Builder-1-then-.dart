import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Gui extends StatefulWidget {
  @override
  _GuiState createState() => _GuiState();
}

class _GuiState extends State<Gui> {
  //  //     //  then ==> with listView.builder ==> no error
  List listOfData = [];

  getDataForGui() {
    FirebaseFirestore.instance
        .collection("user")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((DocumentSnapshot documentSnapshot) {
        setState(() {
          listOfData.add(documentSnapshot.data());
        });
      });
    });
  }

  @override
  void initState() {
    getDataForGui();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: listOfData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("name : ${listOfData[index]["username"]}"),
            subtitle: Text("name : ${listOfData[index]["age"]}"),
          );
        },
      ),
    );
  }
}
