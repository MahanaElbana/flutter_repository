import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NotificationListenerWithListView extends StatefulWidget {
  const NotificationListenerWithListView({super.key});

  @override
  State<NotificationListenerWithListView> createState() =>
      _NotificationListenerWithListViewState();
}

class _NotificationListenerWithListViewState
    extends State<NotificationListenerWithListView> {
  ScrollController scrollController = ScrollController();
  bool expandedStatusNow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " NotificationListener && ScrollController",
          style: TextStyle(fontSize: 13),
        ),
      ),

      // =============== body ========================//
      body: NotificationListener<ScrollNotification>(
       
       // ========== NotificationListener<ScrollNotification> ============//
        onNotification: (notification) {
          if (scrollController.position.userScrollDirection ==
                  ScrollDirection.reverse &&
              expandedStatusNow) {
            setState(() {
              expandedStatusNow = false;
            });
          } else if (scrollController.position.userScrollDirection ==
                  ScrollDirection.forward &&
              !expandedStatusNow) {
            setState(() {
              expandedStatusNow = true;
            });
          }

          return true;
        },
        // ========== NotificationListener<ScrollNotification> ============//
        child: ListView.builder(
          controller: scrollController,   // ==== scrollController
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.primaries[index % (Colors.primaries.length)],
                child: const Icon(
                  Icons.person_outline_outlined,
                  color: Colors.white,
                ),
              ),
              title:  Text("+201${index%20}20770294"),
              trailing: const Text("30 sec"),
              subtitle:const Text("name "), 
            );
          },
          itemCount: (Colors.primaries.length) * 3,
        ),
      ),
      // ==== floatingActionButton ==========//
      floatingActionButton: AnimatedFloatingActionButton(
        expandedStatus: expandedStatusNow,
        onTap: () {
          setState(() {
            expandedStatusNow = !expandedStatusNow;
          });
        },
      ),
    );
  }
}

// ================ AnimatedFloatingActionButton ================//
class AnimatedFloatingActionButton extends StatelessWidget {
  const AnimatedFloatingActionButton({
    super.key,
    required this.expandedStatus,
    required this.onTap,
  });
  final bool expandedStatus;
  final VoidCallback onTap;
  final double _containerSize = 50.0;
  final double _iconSize = 24.0;

  final double _position = 50 / 2 - 24.0 / 2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.blue.shade900,
        ),
        height: _containerSize,
        width: expandedStatus == true ? _containerSize * 2.9 : _containerSize,
        child: Stack(
          children: [
            //================================//
            Positioned(
              top: _position,
              left: _position,
              child: Icon(
                Icons.message_outlined,
                color: Colors.white,
                size: _iconSize,
              ),
            ),
            //================================//
            Positioned(
              top: _position,
              left: _position + _iconSize * 1.5,
              child: const Text(
                "message",
                style: TextStyle(color: Colors.white, fontSize: 19.0),
              ),
            ),
            //================================//
          ],
        ),
      ),
    );
  }
}
