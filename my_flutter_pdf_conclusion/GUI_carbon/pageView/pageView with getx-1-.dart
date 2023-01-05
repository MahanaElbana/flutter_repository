import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewCreated extends StatelessWidget {
  ///--------------   List of pageView  ---------------//

  final List<Container> pageView = <Container>[
    Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: Center(
        child: Text("Home page"),
      ),
    ),
    Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: Center(
        child: Text("Timeline page "),
      ),
    ),
    Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Center(
        child: Text("seach page"),
      ),
    ),
    Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: Center(
        child: Text("upload page"),
      ),
    ),
  ];

  ////----------  ------
  final pagecontroller = PageController(initialPage: 0);

  ///-------  Entery point
  @override
  Widget build(BuildContext context) {
    final PageViewController pageViewController = Get.put(PageViewController());

    return Scaffold(
      ///  -------- -------- ---------- --- ----- body
      body: GetBuilder<PageViewController>(
        init: pageViewController,
        builder: (_) => PageView(
          pageSnapping: true,
          reverse: false,

          scrollDirection: Axis.vertical,
          //  physics: NeverScrollableScrollPhysics(),
          controller: pagecontroller,
          children: this.pageView,

          //////// -----  -------     -------- onPageChanged
          // 2] after page changed ==> we call  pageViewController.onTap(currentIndex);
          // to change icurrent index to change active color
          onPageChanged: (int currentIndex) {
            pageViewController.onTap(currentIndex);
          },
          //////// -----  -------     -------- onPageChanged   ////////
        ),
      ),
      // ---- -----  --------- -------  bottomNavigationBar
      bottomNavigationBar: GetBuilder<PageViewController>(
        init: pageViewController,
        builder: (_) {
          return CupertinoTabBar(
            activeColor: Colors.amber,
            inactiveColor: Colors.grey,
            currentIndex: pageViewController.currentIndex,
            backgroundColor: Colors.purple,
            border: Border.all(width: 3.0, color: Colors.pink),
            iconSize: 45.0,
            //// ----- -----  ----  ----  onTap ----  ----   -------
            onTap: (int index) {
              /// [1] when we change index from choose  BottomNavigationBarItem
              /// page while be changed .
              pagecontroller.animateToPage(index,
                  duration: Duration(microseconds: 1000), curve: Curves.linear);
            },
            //// ----- -----   ----  onTap ----  ----- --- -------
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
              BottomNavigationBarItem(icon: Icon(Icons.search)),
              BottomNavigationBarItem(icon: Icon(Icons.camera)),
              BottomNavigationBarItem(icon: Icon(Icons.notifications_active)),
            ],
          );
        },
      ),
      // ---- -----  --------- -------  bottomNavigationBar
    );
  }
}

class PageViewController extends GetxController {
  int currentIndex = 0;

  onTap(int index) {
    currentIndex = index;
    update();
  }
}
