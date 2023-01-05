import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  //////------------  buildCircle1  ------------//////
  Container buildCircle1(CarouseController carouselController) {
    Color? color;
    if (carouselController.index2.value == 0) {
      color = Colors.purple;
    } else if (carouselController.index2.value == 1) {
      color = Colors.cyan;
    } else {
      color = Colors.pink;
    }
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  //////-----------------  buildCircle2  ----------------//////

  Container buildCircle2(int index, CarouseController carouseController) {
    Color? color;
    if (carouseController.index1.value == index && index == 0) {
      color = Colors.red;
    } else if (carouseController.index1.value == index && index == 1) {
      color = Colors.blue;
    } else if (carouseController.index1.value == index && index == 2) {
      color = Color(0xff159783);
    } else {
      color = Colors.grey;
    }
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CarouseController carouselController = Get.put(CarouseController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() => Text(carouselController.index1.value.toString())),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /////// ----------------   CarouselSlider   ---------------- ///////
              CarouselSlider(
                items: [Colors.red, Colors.blue, Color(0xff159783)].map((e) {
                  return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.85,
                    color: e,
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlayCurve: Curves.easeInOutCubic,
                  pageSnapping: true,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  aspectRatio: 2.0,
                  initialPage: 0,
                  onPageChanged: (int index, _) {
                    carouselController.changeIndex1(index);
                  },
                ),
              ),
              /////
              SizedBox(
                height: 12.0,
              ),

              Obx(
                () => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCircle2(0, carouselController),
                    SizedBox(
                      width: 14.0,
                    ),
                    buildCircle2(1, carouselController),
                    SizedBox(
                      width: 14.0,
                    ),
                    buildCircle2(2, carouselController),
                  ],
                ),
              ),
              /////// ---------------------    CarouselSlider.builder   ---------------- ///////
              CarouselSlider.builder(
                itemCount: [Colors.purple, Colors.cyan, Colors.pink].length,
                itemBuilder: (context, index, _) {
                  return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.85,
                    color: [Colors.purple, Colors.cyan, Colors.pink][index],
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  initialPage: 0,
                  autoPlayAnimationDuration: Duration(seconds: 4),
                  onPageChanged: (int index, _) {
                    carouselController.changeIndex2(index);
                  },
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Obx(() => buildCircle1(carouselController))
            ],
          ),
        ),
      ),
    );
  }
}

class CarouseController extends GetxController {
  RxInt index1 = 0.obs;

  changeIndex1(int i) {
    index1.value = i;
  }

  /////////////////
  RxInt index2 = 0.obs;

  changeIndex2(int i) {
    index2.value = i;
  }
}
