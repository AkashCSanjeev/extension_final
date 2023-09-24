import 'dart:async';

import 'package:comm_client/controller/UIController.dart';
import 'package:comm_client/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ParentConatainer extends StatelessWidget {
  final Widget widget;

  final String widgetID;
  final String parentID = "1";

  ParentConatainer({
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
                if (uiController.widgetFs[0] == false) {
                  print('Right');

                  uiController.leftWidgetWidth = 655;
                  uiController.rightWidgetWidth = 0;
                  uiController.widgetFs[0] = true;
                  uiController.update();
                } else {
                  print('Left');

                  uiController.leftWidgetWidth = 300;
                  uiController.update();
                  Timer(
                    const Duration(milliseconds: 50),
                    () {
                      uiController.widgetFs[0] = false;
                      uiController.rightWidgetWidth = 300;
                      uiController.update();
                    },
                  );
                }
              },
              child: AnimatedContainer(
                duration: uiController.animationDelay,
                width: uiController.leftWidgetWidth,
                height: uiController.widgetFs[0] ? 332 : 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                // TODO: NEED TO CHANGE THIS (WIDGET)
                child: widget,
              ),
            );
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
