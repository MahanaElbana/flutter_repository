import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({super.key});

  @override
  State<AnimatedListPage> createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  List<String> _data = [];

  void _addItem() {
    setState(() {
      _data.insert(0, 'New Item');
      _listKey.currentState!.insertItem(0);
    });
  }

  void _deleteItem(int index) {
    print(_data.length);
    if (_data.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("The list is already empty!"),
        ),
      );
    } else {
      setState(() {
        String removedData = _data[index];
        _data.removeAt(index);
        _listKey.currentState!.removeItem(
          index,
          (context, animation) {
            return ScaleTransition(
              scale: animation,
              child: ListTile(
                title: Text(removedData),
              ),
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _data.length,

        /// ====================================////
        itemBuilder: (context, index, animation) {
          return ScaleTransition(
            scale: animation,
            child: ListTile(
              title: Text(_data[index]),
            ),
          );
        },

        /// ====================================////
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          FloatingActionButton(
            heroTag: "delete",
            onPressed: () => _deleteItem(0),
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: "add",
            onPressed: _addItem,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
///////////////////////////////////////////////////////////////
///

class AnimatedEnter extends StatefulWidget {
  @override
  _AnimatedEnterState createState() => _AnimatedEnterState();
}

class _AnimatedEnterState extends State<AnimatedEnter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Container(
        color: Colors.deepOrange,
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.translationValues(
                      _animation.value * width, 0.0, 0.0),
                  child: child,
                );
              },
              child: Container(
                child: Center(child: Text("hell0")),
              ),
            );
          },
        ),
      ),
    );
  }
}

///////////////////////////////////////

class AnimatedListViewkio extends StatefulWidget {
  const AnimatedListViewkio({Key? key}) : super(key: key);

  @override
  State<AnimatedListViewkio> createState() => _AnimatedListViewkioState();
}

class _AnimatedListViewkioState extends State<AnimatedListViewkio> {
  double screenHeight = 0;
  double screenWidth = 0;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  bool startAnimation = false;

  List<String> texts = [
    "Monetization",
    "Pie Chart",
    "Flag",
    "Notification",
    "Savings",
    "Cloud",
    "Nightlight",
    "Assignment",
    "Location",
    "Settings",
    "Rocket",
    "Backpack",
    "Person",
    "Done All",
    "Search",
    "Extension",
    "Bluetooth",
    "Favorite",
    "Lock",
    "Bookmark",
  ];
  void _deleteItem(int index) {
    print(texts.length);
    if (texts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("The list is already empty!"),
        ),
      );
    } else {
      setState(() {
        String removedData = texts[index];
        var removedDatar = icons[index];
        texts.removeAt(index);
        icons.removeAt(index);
        _listKey.currentState!.removeItem(
          index,
          (context, animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: itemDE(index, removedDatar, removedData),
            );
          },
        );
      });
    }
  }

  List<IconData> icons = [
    Icons.monetization_on,
    Icons.pie_chart,
    Icons.flag,
    Icons.notifications,
    Icons.savings,
    Icons.cloud,
    Icons.nightlight_round,
    Icons.assignment,
    Icons.location_pin,
    Icons.settings,
    Icons.rocket,
    Icons.backpack,
    Icons.person,
    Icons.done_all,
    Icons.search,
    Icons.extension,
    Icons.bluetooth,
    Icons.favorite,
    Icons.lock,
    Icons.bookmark,
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF222431),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  // Future.delayed(const Duration(milliseconds: 500), () {
                  //   setState(() {
                  //     startAnimation = true;
                  //   });
                  // });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            texts.insert(0, 'New Item');
                            icons.insert(0, Icons.add);
                            _listKey.currentState!.insertItem(0);
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                    const Text(
                      "SHOW LIST",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AnimatedList(
                key: _listKey,
                primary: false,
                shrinkWrap: true,
                initialItemCount: texts.length,
                itemBuilder: (context, index, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    axisAlignment: 1,
                    child: item(index),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(int index) {
    return AnimatedContainer(
      height: 55,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform:
          Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${index + 1}. ${texts[index]}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            onPressed: () {

              _deleteItem(index);
            },
            icon: Icon(
              icons[index],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemDE(int index, IconData icon, String textd) {
    return AnimatedContainer(
      height: 55,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      transform:
          Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${textd}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            onPressed: () {
              _deleteItem(index);
            },
            icon: Icon(
              icon,
            ),
          ),
        ],
      ),
    );
  }
}
