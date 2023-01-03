
import 'package:flutter/material.dart';
import 'package:flutter_repository/core/widgets/default_alert_dialog_func.dart';

class TransformedCardScreen extends StatefulWidget {
  const TransformedCardScreen({super.key});

  @override
  State<TransformedCardScreen> createState() => _TransformedCardScreenState();
}

class _TransformedCardScreenState extends State<TransformedCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(" Transformed Card ! "),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 20),
            //////////////////////
            const TransFormedCardWidget(),
            /////////////////

            IconButton(
              icon: const Icon(Icons.done),
              onPressed: () {
                defaultAlertDialog(
                    alertDialogType: AlertDialogType.correct,
                    context: context,
                  );
              },
            ),
            /////////////////
          ],
        ),
      ),
    );
  }
}

class TransFormedCardWidget extends StatelessWidget {
  const TransFormedCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //=============  =======Transform.rotate===1=== =========================//
        Transform.rotate(
          angle: 0.5,
          origin: const Offset(-1, 30),
          child: Card(
            elevation: 0.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.black.withOpacity(0.1),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                    topRight: Radius.circular(25),
                  ),
                  gradient: LinearGradient(colors: [
                    Colors.pink.withOpacity(0.6),
                    Colors.black,
                  ], begin: Alignment.topRight, end: Alignment.bottomRight)),
              height: 200,
              width: 145,
              child: const Center(
                child: Text("mahney"),
              ),
            ),
          ),
        ),
        //=============  =======Transform.rotate===2=== =========================//

        Transform.rotate(
          origin: const Offset(-8, -3),
          angle: 0.3,
          child: Card(
            color: Colors.black.withOpacity(0.1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 0.0,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(70),
                      bottomRight: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(70),
                    ),
                    gradient: LinearGradient(colors: [
                      Colors.yellow.withOpacity(0.8),
                      Colors.yellow.withOpacity(0.2),
                    ], begin: Alignment.topRight, end: Alignment.bottomRight)),
                height: 200,
                width: 145,
                child: const Center(child: Text("mahney"))),
          ),
        ),
        //=============  =======Transform.rotate===3=== =========================//

        Transform.rotate(
          origin: const Offset(0, -2000),
          angle: 0.01,
          child: Card(
            elevation: 30,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.blue,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(colors: [
                  Colors.blue,
                  Color.fromARGB(255, 15, 224, 22),
                ], begin: Alignment.topRight, end: Alignment.bottomLeft),
              ),
              height: 200,
              width: 145,
              child: Column(
                children: [
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                    size: 50,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    "11,670,90",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text(
                    "USD",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  const Text(
                    "&9878.8",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "+8.1%",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),

        //=============  =======end=== =========================//
      ],
    );
  }
}
