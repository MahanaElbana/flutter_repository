import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckboxRadioExpansionTileDropdownButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final getxController =
        Get.put(CheckboxRadioExpansionTileDropdownButtonController());
    return Scaffold(
      appBar: AppBar(title: Text(" Check Radio ExpansionTile Combo ")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /////////--------- --------- [ExpansionTile]  ------------- /////////
            ExpansionTile(
              backgroundColor: Colors.amber.withOpacity(0.6),
              title: Center(child: Text("Account")),
              iconColor: Colors.pink,
              initiallyExpanded: true,
              leading: Icon(Icons.person_add_alt_1_outlined),
              onExpansionChanged: (bool isState) {
                if (isState == true) {
                  print("expanded => $isState");
                }
              },
              childrenPadding: EdgeInsets.only(top: 15.0),
              collapsedBackgroundColor: Colors.amber[900],
              collapsedIconColor: Colors.green,
              collapsedTextColor: Colors.brown,
              textColor: Colors.blueGrey,
              children: [
                /// 1 ]
                ListTile(
                  title: Text("Sign in"),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_circle_down_outlined),
                  ),
                ),

                /// 2 ]
                ListTile(
                  title: Text("Sign in"),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_circle_down_outlined),
                  ),
                ),
              ],
            ),
            /////////--------- --------- [ExpansionTile]  ------------- /////////

            /////////--------- --------- [Checkbox]  ------------- /////////
            ValueBuilder<bool>(
              initialValue: false,
              builder: (bool? ischeck, Function updateFunc) {
                return Checkbox(
                  value: ischeck,
                  onChanged: (bool? newValue) {
                    updateFunc(newValue);
                    print(newValue.toString());
                  },
                );
              },
            ),
            /////////--------- --------- [Checkbox]  ------------- /////////
            ///
            ////////////--------- --------- [DropdownButton]  ------------- /////////
            GetBuilder<CheckboxRadioExpansionTileDropdownButtonController>(
              init: getxController,
              builder: (controller) => DropdownButton<String>(
                isExpanded: true,
                items: [
                  "Egypt",
                  "libnan",
                  "sudioArab",
                  "africia",
                ]
                    .map(
                      (e) => DropdownMenuItem<String>(
                        child: Text("$e"),
                        value: e,
                      ),
                    )
                    .toList(),
                value: controller.dropdownButtonValue,
                onChanged: (value) => controller.dropdownButtonFunc(value),
              ),
            ),
            ////////////--------- --------- [DropdownButton]  ------------- /////////
            ///
            ///////////////--------- --------- [ Radio]  ------------- /////////
            GetBuilder<CheckboxRadioExpansionTileDropdownButtonController>(
              init: getxController,
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("is male"),
                    Radio(
                      value: controller.isFamle,
                      groupValue: controller.radioValue,
                      onChanged: (bool? value) {
                        controller.radioFunc(value ?? false);
                      },
                    ),
                    Radio(
                      value: controller.isMale,
                      groupValue: controller.radioValue,
                      onChanged: (bool? value) {
                        controller.radioFunc(value ?? true);
                      },
                    ),
                    Text("isFamle")
                  ],
                );
              },
            ),
            ///////////////--------- --------- [ Radio]  ------------- /////////
            ///
            /// ///////////////--------- --------- [  RadioListTile]  ------------- /////////
            GetBuilder<CheckboxRadioExpansionTileDropdownButtonController>(
              init: getxController,
              builder: (controller) => Column(
                children: [
                  RadioListTile(
                    title: Text("now"),
                    value: "now",
                    groupValue: getxController.radioDta,
                    onChanged: (String? value) =>
                        getxController.radioDataFunc(value ?? "now"),
                  ),
                  RadioListTile(
                    title: Text("tomorrow"),
                    value: "tomorrow",
                    groupValue: getxController.radioDta,
                    onChanged: (value) => getxController.radioDataFunc(value),
                  ),
                ],
              ),
            )

            /// ///////////////--------- --------- [  RadioListTile]  ------------- /////////
          ],
        ),
      ),
    );
  }
}

class CheckboxRadioExpansionTileDropdownButtonController
    extends GetxController {
  ////////////--------- --------- [DropdownButton]  ------------- /////////
  String dropdownButtonValue = "Egypt";
  dropdownButtonFunc(value) {
    dropdownButtonValue = value;
    update();
  }

  ///////////////--------- --------- [ Radio]  ------------- /////////
  final isMale = true;
  final isFamle = false;
  bool radioValue = false;
  radioFunc(bool value) {
    radioValue = value;
    update();
  }

  ///
  /// ///////////////--------- --------- [  RadioListTile]  ------------- /////////
  String radioDta = "now";
  radioDataFunc(value) {
    radioDta = value;
    update();
  }
}
