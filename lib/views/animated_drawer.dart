
import 'package:flutter/material.dart';
import 'package:flutter_repository/core/widgets/default_snack_bar_func.dart';

class AnimatedDrawerScreen extends StatefulWidget {
  const AnimatedDrawerScreen({super.key});

  @override
  State<AnimatedDrawerScreen> createState() => _AnimatedDrawerScreenState();
}

class _AnimatedDrawerScreenState extends State<AnimatedDrawerScreen> {
  bool isOpend = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Animated Drawer ! "),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Stack(children: [
          //========== first stack item ================//
          Container(
            margin: const EdgeInsets.only(left: 72),
            child: ListView.builder(
              itemCount: 200,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.indigo.shade900,
                    borderRadius: BorderRadius.circular(8.0)),
                height: 80,
                child: const Center(
                  child: Text(
                    "Mahney Elbana",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          ///////////////////
          if (isOpend == true)
            Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.7)),
          //========================//
          AnimatedDrawerWidget(
            onPressed: () {
              setState(() {
                isOpend = !isOpend;
              });
            },
            status: isOpend,
          )
          //==========================//
        ]),
      ),
    );
  }
}

class AnimatedDrawerWidget extends StatelessWidget {
  const AnimatedDrawerWidget(
      {super.key, required this.onPressed, required this.status});
  final Function onPressed;
  final double maxSize = 160.0;
  final double minSize = 60;
  final bool status;
  @override
  Widget build(BuildContext context) {
   
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5.0),
      width: status ? maxSize : minSize,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.indigo.shade900,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: LayoutBuilder(
        builder: (p0, p1) {
         
          double allHeghit = (p1.maxHeight * 0.12 * 6) + 72;
          double logoutheight = p1.maxHeight - allHeghit;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              //=========================//
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                alignment: Alignment.center,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: IconButton(
                  onPressed: () => onPressed(),
                  icon: Icon(
                    status ? Icons.close : Icons.menu,
                    color: Colors.indigo.shade900,
                  ),
                ),
              ),
              //=========================//
              DrawerItem(
                height: p1.maxHeight * 0.12,
                iconData: Icons.house_outlined,
                onPressed: () {
                 showDefaultSnackBar(context, "Home Screen !" ,color: Colors.primaries[0]);
                },
                textString: 'Home',
              ),
              //
              DrawerItem(
                height: p1.maxHeight * 0.12,
                iconData: Icons.dashboard_outlined,
                onPressed: () {
                  showDefaultSnackBar(context, "DashBoard Screen !" ,color: Colors.primaries[1]);
                },
                textString: "DashBoard",
              ),

              //
              DrawerItem(
                height: p1.maxHeight * 0.12,
                iconData: Icons.work_history_outlined,
                onPressed: () {
                 showDefaultSnackBar(context, "Sells Screen !" ,color: Colors.primaries[2]);
                },
                textString: "Sells",
              ),

              //
              DrawerItem(
                height: p1.maxHeight * 0.12,
                iconData: Icons.pest_control_outlined,
                onPressed: () {
                 showDefaultSnackBar(context, "Report a bug Screen !" ,color: Colors.primaries[3]);
                },
                textString: "Report a bug",
              ),

              //
              DrawerItem(
                height: p1.maxHeight * 0.12,
                iconData: Icons.group_rounded,
                onPressed: () {
                   showDefaultSnackBar(context, "Team Screen !" ,color: Colors.primaries[4]);
                },
                textString: "Team",
              ),

              //
              DrawerItem(
                height: p1.maxHeight * 0.12,
                iconData: Icons.settings_suggest_outlined,
                onPressed: () {
                  showDefaultSnackBar(context, "Settins Screen !" ,color: Colors.primaries[4]);
                },
                textString: "Settins",
              ),

              //======================= Divider ==================//
              const Divider(
                color: Colors.white,
                height: 20,
              ),

              //======================= Divider ==================//
              DrawerItem(
                height: logoutheight,
                iconData: Icons.logout_outlined,
                onPressed: () {
                  showDefaultSnackBar(context, "Log out Screen !" ,color: Colors.primaries[4]);
               
                },
                textString: "Log out",
              ),

              //========================//
            ],
          );
        },
      ),
    );
  }
}

//=================== DrawerItem =========================//
class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.height,
    required this.iconData,
    required this.onPressed,
    required this.textString,
  });
  final double height;
  final IconData iconData;
  final void Function() onPressed;
  final String textString;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //================= container for IconButton ===================//
        Container(
          margin: const EdgeInsets.only(left: 8.0),
          alignment: Alignment.centerLeft,
          height: height,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
        //================= Positioned for Text ===================//
        Positioned(
          left: 61,
          top: height * 0.45,
          child: Text(
            textString,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        //================= the end of drawer item  ===================//
      ],
    );
  }
}
