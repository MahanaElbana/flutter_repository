import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreenTask extends StatefulWidget {
  const OnBoardingScreenTask({super.key});

  @override
  State<OnBoardingScreenTask> createState() => _OnBoardingScreenTaskState();
}

class _OnBoardingScreenTaskState extends State<OnBoardingScreenTask> {
  ///--------------   List of pageView  ---------------//

  final List<Container> pageView = <Container>[
    Container(
      color: Colors.amber.shade100,
      alignment: Alignment.center,
      child: const Center(
        child: Text(
          "Home page",
          style: TextStyle(fontSize: 19.0),
        ),
      ),
    ),
    Container(
      color: Colors.red.shade100,
      alignment: Alignment.center,
      child: const Center(
        child: Text(
          "Timeline page ",
          style: TextStyle(fontSize: 19.0),
        ),
      ),
    ),
    Container(
      color: Colors.blue.shade100,
      alignment: Alignment.center,
      child: const Center(
        child: Text(
          "seach page",
          style: TextStyle(fontSize: 19.0),
        ),
      ),
    ),
    Container(
      color: Colors.green.shade100,
      alignment: Alignment.center,
      child: const Center(
        child: Text(
          "upload page",
          style: TextStyle(fontSize: 19.0),
        ),
      ),
    ),
  ];

  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  int currentPage = 0;

  ///-------  Entery point
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///  -------- -------- ---------- --- ----- body
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              pageSnapping: true,
              reverse: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              children: pageView,
              onPageChanged: (int currentIndex) {
                setState(() {
                  currentPage = currentIndex;
                });
              },
            ),
            Positioned(
              bottom: 20.0,
              child: CustomIndictorWidget(
                index: currentPage,
              ),
            ),
            if (currentPage == 3)
              Positioned(
                bottom: 40.0,
                child: CustomOutlinedButton(
                  forgroundString: 'back to built-in implicit',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
          ],
        ),
      ),

      // ---- -----  --------- -------  bottomNavigationBar
      bottomNavigationBar: CupertinoTabBar(
        activeColor: Colors.amber,
        inactiveColor: Colors.grey,
        currentIndex: currentPage,
        backgroundColor: Colors.purple,
        border: Border.all(width: 3.0, color: Colors.pink),
        iconSize: 45.0,
        onTap: (int index) {
          pageController.animateToPage(index,
              duration: const Duration(microseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.camera)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active)),
        ],
      ),

      // ---- -----  --------- -------  bottomNavigationBar
    );
  }
}

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer({
    super.key,
    required this.index,
    required this.currentIndex,
  });

  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: index == currentIndex
          ? const Size(45.0, 10).height
          : const Size(10, 10).height,
      width: index == currentIndex
          ? const Size(45.0, 10).width
          : const Size(10, 10).width,
      duration: const Duration(seconds: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color:
            index == currentIndex ? Colors.blueAccent.shade700 : Colors.black,
      ),
    );
  }
}

class CustomIndictorWidget extends StatelessWidget {
  final int index;
  const CustomIndictorWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...List.generate(4, (index) => index).map(
          (e) {
            return Row(
              children: [
                CustomAnimatedContainer(index: e, currentIndex: index),
                const SizedBox(width: 4)
              ],
            );
          },
        ).toList(),
      ],
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String forgroundString;
  const CustomOutlinedButton({
    super.key,
    required this.onPressed, required this.forgroundString,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        alignment: Alignment.center,
        minimumSize: const Size(220, 45.0),
        shadowColor: Colors.blueGrey.shade300,
        side: const BorderSide(width: 1.5),
      ),
      child:  Text(
        forgroundString,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
