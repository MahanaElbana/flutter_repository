import 'dart:math';

import 'package:flutter/material.dart';

const Color kBlue = Color(0xFF306EFF);
const Color kLightBlue = Color(0xFF4985FD);
const Color kDarkBlue = Color(0xFF1046B3);
const Color kWhite = Color(0xFFFFFFFF);
const Color kGrey = Color(0xFFF4F5F7);
const Color kBlack = Color(0xFF2D3243);

// Padding
const double kPaddingS = 8.0;
const double kPaddingM = 16.0;
const double kPaddingL = 32.0;

// Spacing
const double kSpaceS = 8.0;
const double kSpaceM = 16.0;

// Assets
const String kGoogleLogoPath = 'assets/images/google_logo.png';

/////////////////////////////////////////////////////////////////
class OnboardingFlutterChallenge extends StatefulWidget {
  const OnboardingFlutterChallenge({super.key});

  @override
  State<OnboardingFlutterChallenge> createState() =>
      _OnboardingFlutterChallengeState();
}

class _OnboardingFlutterChallengeState
    extends State<OnboardingFlutterChallenge> {
  double indexCount = 1;
  void Count() {
    if(indexCount == 3){
      setState(() {
        indexCount = 1 ; 
      });
    }
    else{
        setState(() {
      indexCount = indexCount + 1;
    });
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
          child: Column(
            children: [
              Header(
                onSkip: () {
                  print("object");
                },
              ),
              const IconContainer(icon: Icons.temple_hindu, padding: 20.0),
              const TextColumn(
                title: "Welcome to Busble",
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
              ),
              // CardsStack()
              NextPageButton(
                onPressed: () {
                  print("go to the Next Page");
                },
              ),
              SizedBox(
                height: 130,
              ),
              SizedBox(
                height: 70,
                width: 70,
                child: CustomPaint(
                  painter: _OnboardingPageIndicatorPainter(
                      color: kWhite,
                      startAngle: pi * 0.9,
                      indicatorLength: indexCount),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: NextPageButton(
                      onPressed: () {
                        // print("go to the Next Page");
                        Count();
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//============ Logo Widget =======//
class Logo extends StatelessWidget {
  final Color color;
  final double size;
  const Logo({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 4,
      child: Icon(
        Icons.format_bold,
        color: color,
        size: size,
      ),
    );
  }
}

//============ Header Widget =======//

class Header extends StatelessWidget {
  final VoidCallback onSkip;
  const Header({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(
          color: kWhite,
          size: 32.0,
        ),
        GestureDetector(
          onTap: onSkip,
          child: Text(
            "Skip",
            //style: TextStyle(color: kWhite),
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: kWhite,
                ),
          ),
        ),
      ],
    );
  }
}

//============ Icon Container Widget =======//
class IconContainer extends StatelessWidget {
  final IconData icon;
  final double padding;
  const IconContainer({super.key, required this.icon, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: kWhite.withOpacity(0.25),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 32.0,
        color: kWhite,
      ),
    );
  }
}

//============ TextColumn Widget =======//

class TextColumn extends StatelessWidget {
  final String title;
  final String text;
  const TextColumn({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: kWhite,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: kSpaceS,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: kWhite),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

//============ TextColumn Widget =======//
class CardsStack extends StatelessWidget {
  final int pageNumber;
  final Widget lightCardChild;
  final Widget darkCardChild;
  const CardsStack(
      {super.key,
      required this.pageNumber,
      required this.lightCardChild,
      required this.darkCardChild});
  bool get isOddPageNumber => pageNumber % 2 == 1;
  @override
  Widget build(BuildContext context) {
    double darkCardWidth = MediaQuery.of(context).size.width - 2 * kPaddingL;
    double darkCardHeight = MediaQuery.of(context).size.height / 3;
    return Padding(
      padding: EdgeInsets.only(top: isOddPageNumber ? 25.0 : 50.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            color: kDarkBlue,
            child: Container(
              width: darkCardWidth,
              height: darkCardHeight,
              padding: EdgeInsets.only(
                top: !isOddPageNumber ? 100.0 : 0.0,
                bottom: isOddPageNumber ? 100.0 : 0.0,
              ),
              child: Center(child: darkCardChild),
            ),
          ),
          Positioned(
            top: !isOddPageNumber ? -25.0 : null,
            bottom: isOddPageNumber ? -25.0 : null,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: kLightBlue,
              child: Container(
                width: darkCardWidth * 0.8,
                height: darkCardHeight * 0.5,
                padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
                child: Center(child: lightCardChild),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============== Next Button widget ===================//
class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(kPaddingM),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: kWhite,
      onPressed: onPressed,
      child: const Icon(
        Icons.arrow_forward,
        color: kBlue,
        size: 32.0,
      ),
    );
  }
}

// ============== Onboardign Page Indicator Painter ======//

class _OnboardingPageIndicatorPainter extends CustomPainter {
  final Color color;
  final double startAngle;
  final double indicatorLength;

  _OnboardingPageIndicatorPainter({
    required this.color,
    required this.startAngle,
    required this.indicatorLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

   //  print("size of shortestSide ${size.shortestSide}");
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(
          size.width / 2,
          size.height / 2,
        ),
        radius: (size.shortestSide + 12.0) / 2,
      ),
      startAngle,
      indicatorLength * 2.0933333333,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_OnboardingPageIndicatorPainter oldDelegate) {
    return color != oldDelegate.color || startAngle != oldDelegate.startAngle;
  }
}
