import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CardsMostionAnimation extends StatelessWidget {
  const CardsMostionAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'My Playlist',
          style: TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => null,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: CardsBody(),
           
          ),
          Expanded(
            flex: 2,
           child: CardsHorizontal(),
            
          ),
        ],
      ),
    );
  }
}

class CardsBody extends StatefulWidget {
  const CardsBody({Key? key}) : super(key: key);

  @override
  _CardsBodyState createState() => _CardsBodyState();
}

class _CardsBodyState extends State<CardsBody> with TickerProviderStateMixin {
  bool _selectedMode = false;
  late AnimationController _animationControllerSelection;
  late AnimationController _animationControllerMovement;
  int? _selectedIndex;

  Future<void> _onCardSelected(Card3D card, int index) async {
    setState(() {
      _selectedIndex = index;
    });
    const duration = Duration(milliseconds: 650);
    _animationControllerMovement.forward();
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: duration,
        reverseTransitionDuration: duration,
        pageBuilder: (context, animation, _) => FadeTransition(
          opacity: animation,
          child: CardsDetails(
            card: card,
          ),
        ),
      ),
    );
    _animationControllerMovement.reverse(from: 1.0);
  }

  int _getCurrentFactor(int currentIndex) {
    if (_selectedIndex == null || currentIndex == _selectedIndex) {
      return 0;
    } else if (currentIndex > _selectedIndex!) {
      return -1;
    } else {
      return 1;
    }
  }

  @override
  void initState() {
    _animationControllerSelection = AnimationController(
      vsync: this,
      lowerBound: 0.15,
      upperBound: 0.5,
      duration: const Duration(milliseconds: 500),
    );
    _animationControllerMovement = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationControllerSelection.dispose();
    _animationControllerMovement.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedBuilder(
          animation: _animationControllerSelection,
          builder: (context, snapshot) {
            final selectionValue = _animationControllerSelection.value;
            return GestureDetector(
              onTap: () {
                if (!_selectedMode) {
                  _animationControllerSelection.forward().whenComplete(() {
                    setState(() {
                      _selectedMode = true;
                    });
                  });
                } else {
                  _animationControllerSelection.reverse().whenComplete(() {
                    setState(() {
                      _selectedMode = false;
                    });
                  });
                }
              },
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(selectionValue),
                child: AbsorbPointer(
                  absorbing: !_selectedMode,
                  child: Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth * 0.6,
                    color: Colors.white,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: List.generate(
                        4,
                        (index) => Card3DItem(
                          height: constraints.maxHeight / 2,
                          card: cardList[index],
                          percent: selectionValue,
                          depth: index,
                          verticalFactor: _getCurrentFactor(index),
                          animation: _animationControllerMovement,
                          isForward: _animationControllerMovement.status ==
                              AnimationStatus.forward,
                          onCardSelected: (card) {
                            _onCardSelected(card, index);
                          },
                        ),
                      ).reversed.toList(),
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }
}

class Card3DItem extends AnimatedWidget {
  const Card3DItem({
    Key? key,
    this.card,
    this.percent,
    this.height,
    this.depth,
    this.onCardSelected,
    this.verticalFactor = 0,
    this.isForward = false,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  final Card3D? card;
  final double? percent;
  final double? height;
  final int? depth;
  final ValueChanged<Card3D>? onCardSelected;
  final int verticalFactor;
  final bool isForward;

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    const depthFactor = 50.0;
    final bottomMargin = height! / 6.0;

    return Positioned(
      left: 0,
      right: 0,
      top: height! + -depth! * height! / 2.0 * percent! - bottomMargin,
      child: Opacity(
        opacity:
            verticalFactor == 0 ? 1 : (isForward ? (1 - animation.value) : 1.0),
        child: Hero(
          tag: card!.title!,
          flightShuttleBuilder: (context, animation, flighDirection,
              fromHeroContext, toHeroContext) {
            Widget _current;
            double _depth = 0.0;

            if (flighDirection == HeroFlightDirection.push) {
              _current = toHeroContext.widget;
            } else {
              _current = fromHeroContext.widget;
             _depth = depth! * lerpDouble(0.0, depthFactor, animation.value)!;
            }

            return AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                final newValue = lerpDouble(0.5, 2 * pi, animation.value)!;
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..translate(0.0, 0.0, _depth)
                    ..rotateX(newValue),
                  child: _current,
                );
              },
            );
          },
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(
                0.0,
                verticalFactor *
                    animation.value *
                    MediaQuery.of(context).size.height,
                depth! * depthFactor,
              ),
            child: GestureDetector(
              onTap: () {
                onCardSelected!(card!);
              },
              child: SizedBox(
                height: height,
                child: Card3DWidget(
                  card: card,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class Card3D {
  const Card3D({this.author, this.title, this.image});
  final String? title;
  final String? author;
  final String? image;
}

final cardList = [
  const Card3D(
      author: 'Kate Bush',
      title: 'Running Up That Hill',
      image: 'assets/images/grid_list_switch/Soy_Coffee_Latte.png'),
  const Card3D(author: 'Dark Rooms', title: 'I Get overwhelmed', image: 'assets/images/work1.png'),
  const Card3D(author: 'Mac Miller', title: 'Come back to Earth', image: 'assets/images/card_images/v1.jpg'),
  const Card3D(author: 'Lng Sht', title: 'La marcha de los tristes', image: 'assets/images/card_images/v2.jpg'),
  const Card3D(author: 'Beirut', title: 'Postcard from Italy', image: 'assets/images/card_images/v3.jpg'),
  const Card3D(author: 'Roy Woods', title: 'Drama (feat. Drake)', image: 'assets/images/card_images/v4.jpg'),
];

class Card3DWidget extends StatelessWidget {
  const Card3DWidget({Key? key, this.card}) : super(key: key);

  final Card3D? card;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(15.0);
    return PhysicalModel(
      color: Colors.white,
      elevation: 10,
      borderRadius: border,
      child: ClipRRect(
        borderRadius: border,
        child: Image.asset(
          card!.image!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CardsHorizontal extends StatelessWidget {
  const CardsHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Recently Played',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardList.length,
                itemBuilder: (context, index) {
                  final card = cardList[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 45 + bottom, right: 20, left: 20),
                    child: Card3DWidget(card: card),
                  );
                }),
          ),
        ],
      ),
    );
  }
}




class CardsDetails extends StatelessWidget {
  const CardsDetails({
    Key? key,
    required this.card,
  }) : super(key: key);

  final Card3D card;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black45,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //SizedBox(height: size.height * 0.08),
              Align(
                child: SizedBox(
                  height: 220.0,
                  child: Hero(
                    tag: card.title!,
                    child: Card3DWidget(
                      card: card,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                card.title!,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                card.author!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              Slider(
                activeColor: Colors.pink[400],
                inactiveColor: Colors.grey[200],
                value: 0.3,
                onChanged: (val) {},
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shuffle, color: Colors.black45),
                    onPressed: () => null,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue[800],
                    child: IconButton(
                      icon: const Icon(Icons.pause, color: Colors.white),
                      onPressed: () => null,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.repeat, color: Colors.black45),
                    onPressed: () => null,
                  ),
                ],
              ),
              const Spacer(),
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 900),
                tween: Tween(begin: 1.0, end: 0.0),
                curve: const ElasticOutCurve(0.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Next Song',
                      style: TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(
                          height: 40,
                          child: Card3DWidget(
                            card: cardList[3],
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text('Perfect - Ed Sheeran'),
                        const Spacer(),
                        IconButton(
                          icon: Icon(Icons.favorite,
                              color: Colors.pink.withOpacity(0.8)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                builder: (context, dynamic value, child) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 300 * value as double),
                    child: child,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}