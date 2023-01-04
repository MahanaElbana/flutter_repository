import 'package:flutter/material.dart';
import 'package:flutter_repository/core/constants/constant_strings.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFF041C32),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'أركان',
            style: TextStyle(
                fontFamily: FontsApp.fontFamily, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child:  Icon(
                    Icons.contact_support,
                    color:  Color(0xFF041C32),
                  )),
              onPressed: () {},
            ),
          ],
        ),
        body: const LocationsWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: Icon(
            Icons.favorite,
            color: Colors.redAccent.shade700,
            size: 31.0,
          ),
        ),
      );
}

//////////////   LocationWidget   ///////////////////////

class LocationWidget extends StatefulWidget {
  final Location location;

  const LocationWidget({required this.location, Key? key}) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpanded ? 5 : 100,
            width: isExpanded ? size.width * 0.78 : size.width * 0.7,
            height: isExpanded ? size.height * 0.7 : size.height * 0.5,
            //child: ExpandedContentWidget(location: widget.location),
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(8),
              child:
                  //--------------------- main Categories ------------------//
                  Container(
                alignment: Alignment.bottomCenter,
                height: 175,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: allCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            //--------------- to select subcategories ----------//
                            onTap: () {
                              // setState(() {
                              //   CategoryController.updateMainCategorySelection(index);
                              //   selectedItem = index ;
                              // });
                            },
                            child: Container(
                              height: 120.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                      allCategories[index]["picture"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                         const   SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            allCategories[index]["mainCategory"],
                            style: const TextStyle(
                                fontFamily: FontsApp.fontFamily,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              //--------------------- main Categories ------------------//
              ///
            ),

            ////////////////////
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpanded ? 230 : 100,
            child: GestureDetector(
              onPanUpdate: onPanUpdate,
                onTap:  (){
                      setState(() {
                        isExpanded?isExpanded=false:isExpanded=true;
                      });
                },
              child: ImageWidget(location: widget.location),
            ),
          ),
        ],
      ),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}

//////////////   ImageWidget   ///////////////////////

class ImageWidget extends StatelessWidget {
  final Location location;

  const ImageWidget({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: size.height * 0.5,
      width: size.width * 0.8,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            buildImage(),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTopText(),

                  // Center(child: Text('القدس'))
                ],
              ),
            ),

            //===========  main category =================//
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.05),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: const Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "القدس",
                      style: TextStyle(
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
    );
  }

  Widget buildImage() => SizedBox.expand(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Image.asset(location.urlImage, fit: BoxFit.cover),
        ),
      );

  Widget buildTopText() => const CircleAvatar(
      backgroundColor: Colors.black12,
      radius: 20,
      child: Icon(
      // Icons.swipe_up_outlined,
      Icons.swap_vert_sharp,
        color: Colors.white,
      ));
}

///////

class LatLongWidget extends StatelessWidget {
  final Location location;

  const LatLongWidget({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            location.latitude,
            style: const TextStyle(color: Colors.white70),
          ),
          const Icon(Icons.location_on, color: Colors.white70),
          Text(
            location.longitude,
            style: const TextStyle(color: Colors.white70),
          )
        ],
      );
}

////////////////////////

class StarsWidget extends StatelessWidget {
  final int stars;

  const StarsWidget({
    Key? key,
    required this.stars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allStars = List.generate(stars, (index) => index);

    return Row(
      children: allStars
          .map((star) => Container(
                margin: const EdgeInsets.only(right: 4),
                child: const Icon(Icons.star_rate,
                    size: 18, color: Colors.blueGrey),
              ))
          .toList(),
    );
  }
}

////////////////////////

class LocationsWidget extends StatefulWidget {
  const LocationsWidget({Key? key}) : super(key: key);

  @override
  State<LocationsWidget> createState() => _LocationsWidgetState();
}

class _LocationsWidgetState extends State<LocationsWidget> {
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];

                return LocationWidget(location: location);
              },
              onPageChanged: (index) => setState(() => pageIndex = index),
            ),
          ),
          Text(
            '${pageIndex + 1}/${locations.length}',
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 40.0)
        ],
      );
}
////////////

////////////////

class Location {
  final String name;
  final String urlImage;
  final String latitude;
  final String longitude;
  final String addressLine1;
  final String addressLine2;
  final int starRating;
  final List<Review> reviews;

  Location({
    required this.reviews,
    required this.name,
    required this.urlImage,
    required this.latitude,
    required this.longitude,
    required this.addressLine1,
    required this.addressLine2,
    required this.starRating,
  });
}

class Review {
  final String username;
  final String urlImage;
  final String date;
  final String description;

  Review({
    required this.username,
    required this.urlImage,
    required this.date,
    required this.description,
  });
}

/////////////////////

List<Location> locations = [
  Location(
    name: '',
    urlImage: "assets/images/card_images/v1.jpg",
    addressLine1: '4670 Auto Mall Pkwy',
    addressLine2: 'Fremont CA 94538',
    starRating: 4,
    latitude: '',
    longitude: '',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: '',
    urlImage: "assets/images/card_images/v2.jpg",
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 11641',
    starRating: 4,
    latitude: '',
    longitude: '',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: '',
    urlImage: "assets/images/card_images/v3.jpg",
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 791187',
    starRating: 4,
    latitude: '',
    longitude: '',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: '',
    urlImage: "assets/images/card_images/v4.jpg",
    addressLine1: '3315 University Drive',
    addressLine2: 'Bismarck ND 58504',
    starRating: 5,
    latitude: '',
    longitude: '',
    reviews: Reviews.allReviews,
  ),
];

/////

class Reviews {
  static List<Review> allReviews = [
    Review(
      date: 'FEB 14th',
      username: 'Michael Scoffield',
      urlImage: "assets/images/card_images/v1.jpg",
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
    ),
    Review(
      date: 'JAN 24th',
      username: 'Daniel Kraig',
      urlImage: "assets/images/card_images/v2.jpg",
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
    ),
    Review(
      date: 'MAR 18th',
      username: 'Amanda Linn',
      urlImage: "assets/images/card_images/v3.jpg",
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
    ),
    Review(
      date: 'AUG 15th',
      username: 'Kim Wexler',
      urlImage: "assets/images/card_images/v4.jpg",
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
    ),
  ];
}

///

class HeroWidget extends StatelessWidget {
  final String tag;
  final Widget child;

  const HeroWidget({
    required this.tag,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Hero(
        tag: tag,
        child: Material(type: MaterialType.transparency, child: child),
      );
}

//

class DetailedInfoWidget extends StatelessWidget {
  final Location location;

  const DetailedInfoWidget({
    required this.location,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroWidget(
              tag: HeroTag.addressLine1(location),
              child: Text(location.addressLine1),
            ),
            const SizedBox(height: 8),
            HeroWidget(
              tag: HeroTag.addressLine2(location),
              child: Text(location.addressLine2),
            ),
            const SizedBox(height: 8),
            HeroWidget(
              tag: HeroTag.stars(location),
              child: StarsWidget(stars: location.starRating),
            ),
          ],
        ),
      );
}

//

class DetailPage extends StatelessWidget {
  final Location location;
  final Animation<double> animation;

  const DetailPage({
    required this.location,
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('INTERESTS'),
          centerTitle: true,
          actions: [
             IconButton(
              icon:const Icon(Icons.close),
              onPressed: Navigator.of(context).pop,
            ),
           const SizedBox(width: 10)
          ],
          leading: const Icon(Icons.search_outlined),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox.expand(
                    child: HeroWidget(
                      tag: HeroTag.image(location.urlImage),
                      child: Image.asset(location.urlImage, fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: LatLongWidget(location: location),
                  ),
                ],
              ),
            ),
            DetailedInfoWidget(location: location),
            Expanded(
              flex: 5,
              child: ReviewsWidget(location: location, animation: animation),
            ),
          ],
        ),
      );
}

class ReviewsWidget extends StatelessWidget {
  final Location location;
  final Animation<double> animation;

  const ReviewsWidget({
    required this.location,
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
      itemCount: location.reviews.length,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final review = location.reviews[index];

        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) => FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve:const Interval(0.2, 1, curve: Curves.easeInExpo),
            ),
            child: child,
          ),
          child: buildReview(review),
        );
      });

  Widget buildReview(Review review) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeroWidget(
                  tag: HeroTag.avatar(review, locations.indexOf(location)),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black12,
                    backgroundImage: AssetImage(review.urlImage),
                  ),
                ),
                Text(
                  review.username,
                  style: const TextStyle(fontSize: 17),
                ),
               const SizedBox(),
                Text(
                  review.date,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const Icon(Icons.thumb_up_alt_outlined, size: 14)
              ],
            ),
            const SizedBox(height: 8),
            Text(
              review.description,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      );
}

class HeroTag {
  static String image(String urlImage) => urlImage;

  static String addressLine1(Location location) =>
      location.name + location.addressLine1;

  static String addressLine2(Location location) =>
      location.name + location.addressLine2;

  static String stars(Location location) =>
      location.name + location.starRating.toString();

  static String avatar(Review review, int position) =>
      review.urlImage + position.toString();
}

List allCategories = [
  {"picture": "assets/images/card_images/v1.jpg", "mainCategory": "القدس"},
  {"picture": "assets/images/card_images/v1.jpg", "mainCategory": "القدس"},
  {"picture": "assets/images/card_images/v1.jpg", "mainCategory": "القدس"},
  {"picture": "assets/images/card_images/v1.jpg", "mainCategory": "القدس"}
];
