import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter_repository/core/constants/constant_strings.dart';
import 'package:flutter/gestures.dart';

class CardListAnimation extends StatelessWidget {
  const CardListAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,

      //  bottomNavigationBar: CustomBottomNavigationBar(),
      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: Colors.red,
        centerTitle: true,
        backgroundColor: Colors.grey.shade50,
        title: const Text(
          'الصفحه الرئسية',
          style:
              TextStyle(fontFamily: FontsApp.fontFamily, color: Colors.black),
        ),
      ),

      //===================================================//
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //===================================================//
             Directionality(
              textDirection: TextDirection.rtl,
              child:  Padding(
                padding: const EdgeInsets.only(top: 30.0 ,right: 12.0),
                child: Container(alignment: Alignment.topRight ,child: const Text('الاقسام الرئسية' 
                ,style: TextStyle(fontFamily: FontsApp.fontFamily ,fontSize: 25.0 ,fontWeight: FontWeight.w700),)),
              ),
            ),

            //===================================================//
            SizedBox(
              height: mediaQuery.size.height * 0.45,
              child: const TransformPageViewWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

//----------------- TransformPageViewWidget -------------------------//

class TransformPageViewWidget extends StatefulWidget {
  const TransformPageViewWidget({Key? key}) : super(key: key);

  @override
  State<TransformPageViewWidget> createState() =>
      _TransformPageViewWidgetState();
}

class _TransformPageViewWidgetState extends State<TransformPageViewWidget> {
  List<VacationSpots> pageItems = generateSomeData();

  PageController? pageController;
  var viewportFraction = 0.8;
  double? pageOffset = 0;
  Size? size;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(
            () => setState(
              () => pageOffset = pageController!.page,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      itemCount: pageItems.length,
      itemBuilder: (context, index) {
        double scale = max(viewportFraction,
            1 - (pageOffset! - index).abs() + viewportFraction);

        double angleY = (pageOffset! - index).abs();
        if (angleY > 0.5) {
          angleY = 1 - angleY;
        }
        return Padding(
          padding: EdgeInsets.only(
            right: size!.width * 0.04,
            left: size!.width * 0.04,
            top: 100 - scale * 38,
            bottom: size!.width * 0.06,
          ),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angleY),
            alignment: Alignment.center,
            child: GestureDetector(
              //=============== function to toggle sub categories ================//
              onTap: () {
                print(pageItems[index].title);
              },
              //=============== function to toggle sub categories ================//
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                color: Colors.transparent,
                elevation: 14.0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          pageItems[index].img!,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      //===========  main category =================//
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: AnimatedOpacity(
                          opacity: angleY == 0 ? 1 : 0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 20, right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.8),
                                ],
                              ),
                            ),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                pageItems[index].title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                    fontFamily: FontsApp.fontFamily),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //======================= main category==============//
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// ====================  VacationSpots   ==================== ///
class VacationSpots {
  String? title, caption, img;

  VacationSpots(
    this.title,
    this.caption,
    this.img,
  );
}

List<VacationSpots> generateSomeData() {
  List<String> titleList = [
    "لندن",
    "قرنسا",
    "السويس",
    "المعرب",
  ];

  List<String> captionList = [
    "United Kingdom",
    "Germany",
    "Switzerland",
    "Maldives",
  ];

  List<String> assetName = [
    "assets/images/card_images/v1.jpg",
    "assets/images/card_images/v2.jpg",
    "assets/images/card_images/v3.jpg",
    "assets/images/card_images/v4.jpg",
  ];

  List<VacationSpots> list = List.generate(
    4,
    (index) => VacationSpots(
      titleList[index],
      captionList[index],
      assetName[index],
    ),
  );
  return list;
}



//============================================//




//! This class is to support scrolling with mouse on flutter web
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}