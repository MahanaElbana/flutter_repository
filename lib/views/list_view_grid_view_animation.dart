import 'package:flutter/material.dart';

class ListViewGridViewAnimation extends StatefulWidget {
  const ListViewGridViewAnimation({super.key});

  @override
  State<ListViewGridViewAnimation> createState() =>
      _ListViewGridViewAnimationState();
}

class _ListViewGridViewAnimationState extends State<ListViewGridViewAnimation> {
  //======== variables and functions ==============//
  static int view = 1;
  static PageController controllerListView =
      PageController(viewportFraction: 1 / 5);

  void togleBettweenlistAndGrid(int index) {
    
    if (view != index) {
      view = index;
      Navigator.of(context).pushReplacement(
        animatedRouteTransition(
          const ListViewGridViewAnimation(),
        ),
      );
    }
  }

//======== variables and functions ==============//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ============== AppBar ==============//
      appBar: AppBar(
          elevation: 0.0,
          title: const Text(
            'Drinks',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                togleBettweenlistAndGrid(1);
              },
              icon: Icon(
                Icons.grid_view_rounded,
                color: view == 2 ? Colors.grey.shade300 : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                togleBettweenlistAndGrid(2);
              },
              icon: Icon(
                Icons.list_alt_rounded,
                color: view == 1 ? Colors.grey.shade300 : Colors.black,
              ),
            ),
          ]),
      // ============== body ==============//
      body: (view == 2)
          ? PageView(
              physics: const BouncingScrollPhysics(),
              controller: controllerListView,
              scrollDirection: Axis.vertical,
              pageSnapping: false,
              padEnds: false,
              children: <Hero>[
                ...drinkItems.map((e) {
                  return Hero(
                      tag: e.price,
                      child: ListCardWidget(
                        drinkModel: e,
                        onPressedCart: () {
                         // print("cart");
                        },
                        onPressedFavorite: () {
                        //  print("favorite");
                        },
                      ));
                }).toList(),
              ],
            )
          : GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(3.0),
              children: drinkItems.map((e) {
                return Hero(
                  tag: e.price,
                  child: GridViewCardWidget(
                    drinkModel: e,
                    onPressedCart: () {
                    // print("cart");
                    },
                    onPressedFavorite: () {
                    //  print("favorite");
                    },
                  ),
                );
              }).toList(),
            ),
    );
  }
}

Route animatedRouteTransition(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) =>
        destination,
    transitionDuration: const Duration(milliseconds: 1200),
    reverseTransitionDuration: const Duration(milliseconds: 1200),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCirc,
          reverseCurve: Curves.easeOutCirc.flipped,
        ),
        child: child,
      );
    },
  );
}

class GridViewCardWidget extends StatelessWidget {
  final DrinkModel drinkModel;
  final void Function() onPressedFavorite;
  final void Function() onPressedCart;
  const GridViewCardWidget(
      {required this.drinkModel,
      super.key,
      required this.onPressedFavorite,
      required this.onPressedCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      elevation: 1.5,
      borderOnForeground: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: Image.asset(
              drinkModel.picturePath,
              height: 120,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(top: 8, left: 8),
              alignment: Alignment.topLeft,
              child: Text(
                drinkModel.drinkName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(bottom: 8, left: 8),
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 8,
                    child: Text(
                      drinkModel.price,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: onPressedCart,
                            icon: const Icon(
                              Icons.add_shopping_cart_rounded,
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: onPressedFavorite,
                            icon: const Icon(
                              Icons.favorite_border_sharp,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListCardWidget extends StatelessWidget {
  final DrinkModel drinkModel;
  final void Function() onPressedFavorite;
  final void Function() onPressedCart;
  const ListCardWidget(
      {required this.drinkModel,
      super.key,
      required this.onPressedFavorite,
      required this.onPressedCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(6.0),
      elevation: 2.0,
      borderOnForeground: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(
              alignment: Alignment.centerLeft,
              drinkModel.picturePath,
              height: 130,
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    drinkModel.drinkName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    drinkModel.price,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: onPressedFavorite,
                  icon: const Icon(
                    Icons.add_shopping_cart_rounded,
                  ),
                ),
                IconButton(
                  onPressed: onPressedFavorite,
                  icon: const Icon(
                    Icons.favorite_border_sharp,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrinkModel {
  final String picturePath;
  final String drinkName;
  final String price;

  DrinkModel(
      {required this.picturePath,
      required this.drinkName,
      required this.price});
}

List<DrinkModel> drinkItems = <DrinkModel>[
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Coffee_Latte.png',
      drinkName: 'Soy Coffee ',
      price: '30.0 LE'),
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Matcha_Latte.png',
      drinkName: 'Soy Matcha',
      price: '40.0 LE'),
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Matcha_Latte.png',
      drinkName: 'Soy Matcha',
      price: '50.0 LE'),
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Coffee_Latte.png',
      drinkName: 'Soy Coffee',
      price: '25.0 LE'),
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Coffee_Latte.png',
      drinkName: 'Soy Coffee',
      price: '32.0 LE'),
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Matcha_Latte.png',
      drinkName: 'Soy Matcha',
      price: '26.0 LE'),
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Matcha_Latte.png',
      drinkName: 'Soy Matcha',
      price: '44.0 LE'),
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Coffee_Latte.png',
      drinkName: 'Soy Coffee',
      price: '58.0 LE'),
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Coffee_Latte.png',
      drinkName: 'Soy Coffee',
      price: '36.0 LE'),
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Matcha_Latte.png',
      drinkName: 'Soy Matcha',
      price: '47.0 LE'),
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Coffee_Latte.png',
      drinkName: 'Soy Coffee',
      price: '66.0 LE'),
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Matcha_Latte.png',
      drinkName: 'Soy Matcha',
      price: '48.0 LE'),
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Coffee_Latte.png',
      drinkName: 'Soy Coffee',
      price: '19.0 LE'),
  DrinkModel(
      picturePath: 'assets/images/grid_list_switch/Soy_Matcha_Latte.png',
      drinkName: 'Soy Matcha',
      price: '27.5 LE'),
];
