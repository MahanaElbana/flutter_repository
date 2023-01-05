import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Gui extends StatefulWidget {
  @override
  _GuiState createState() => _GuiState();
}

class _GuiState extends State<Gui> {
  //  //     //  then , async and await ==> with listView.builder ==> no error
  // // / // to overcome any error following this method
  // نعمل شرط لانتظار البيانات
  List listOfData = [];

  getDataForGui() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("user");

    QuerySnapshot querySnapshot = await collectionReference.get();

    List<DocumentSnapshot> documentSnapshot = querySnapshot.docs;

    documentSnapshot.forEach((DocumentSnapshot documentSnapshot) {
      setState(() {
        listOfData.add(documentSnapshot);
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
      body: listOfData.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
                color: Colors.purple,
              ),
            )
          : ListView.builder(
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
