import 'dart:async';
import 'package:comm_client/Widgets/parentWidget/ParentContainer.dart';
import 'package:comm_client/Widgets/parentWidget/ParentContainer2.dart';
import 'package:comm_client/controller/UIController.dart';
import 'package:comm_client/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MainColumn extends StatefulWidget {
  const MainColumn({super.key});

  @override
  State<MainColumn> createState() => _MainColumnState();
}

class _MainColumnState extends State<MainColumn> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientController>(
        // init: ClientController(),
        builder: ((controller) {
      return GetBuilder<UIController>(builder: (uiController) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 11.5, 14),
          child: AnimatedContainer(
            duration: uiController.animationDelay,
            width: 655,
            height: 332,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                // Parent 1
                Padding(
                  padding:
                      (uiController.widgetFs[0] || uiController.widgetFs[1])
                          ? const EdgeInsets.all(0)
                          : const EdgeInsets.fromLTRB(20, 16, 7.5, 16),
                  child: ParentConatainer(
                      widget: controller.w1!, widgetID: controller.w1ID!),
                ),
                // Parent 2
                Padding(
                  padding:
                      (uiController.widgetFs[0] || uiController.widgetFs[1])
                          ? const EdgeInsets.all(0)
                          : const EdgeInsets.fromLTRB(7.5, 16, 20, 16),
                  child: ParentConatainer2(
                      widget: controller.w2!, widgetID: controller.w2ID!),
                ),
              ],
            ),
          ),
        );
      });
    }));
  }
}
