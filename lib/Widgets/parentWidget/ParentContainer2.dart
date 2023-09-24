import 'dart:async';

import 'package:comm_client/controller/UIController.dart';
import 'package:comm_client/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ParentConatainer2 extends StatelessWidget {
  final Widget widget;

  final String widgetID;
  final String parentID = "2";

  ParentConatainer2({
    super.key,
    required this.widget,
    required this.widgetID,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientController>(builder: (controller) {
      return DragTarget(
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return GetBuilder<UIController>(builder: (uiController) {
            // return GestureDetector(
            //     // onTap: () => uiCOntroller.toggle(uiCOntroller.oneWidgetLg),
            //     onDoubleTap: () {
            //       print("Tapped $widgetID $parentID ");
            //       controller.handleMessage("$widgetID $parentID d");
            //     },
            //     child: widget);
            return GestureDetector(
                onLongPress: () {
                  print("Tapped $widgetID $parentID ");
                  controller.sendMEssage("$widgetID $parentID d");
                },
                onDoubleTap: () {
                  int sensi = 500;
                  // double velocity = details.primaryVelocity!;
                  if (uiController.widgetFs[1] == true) {
                    print('Right');

                    uiController.rightWidgetWidth = 300;
                    uiController.update();
                    Timer(const Duration(milliseconds: 50), () {
                      uiController.widgetFs[1] = false;
                      uiController.leftWidgetWidth = 300;
                      uiController.update();
                    });
                  } else {
                    print('Left');

                    uiController.rightWidgetWidth = 655;
                    uiController.leftWidgetWidth = 0;
                    uiController.widgetFs[1] = true;
                    uiController.update();
                  }
                },
                child: AnimatedContainer(
                  duration: uiController.animationDelay,
                  width: uiController.rightWidgetWidth,
                  height: uiController.widgetFs[1] ? 332 : 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // Need to change this widget2
                  child: widget,
                ));
          });
        },
        onAccept: (String data) {
          if (parentID != data) {
            print('Accepted');
            controller.swapWidget(parentID, data);
          } else {
            print("same $data");
          }
        },
      );
    });
  }
}
