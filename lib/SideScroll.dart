import 'package:comm_client/Widgets/parentWidget/ParentContainer3.dart';
import 'package:comm_client/Widgets/parentWidget/ParentContainer4.dart';
import 'package:comm_client/Widgets/parentWidget/ParentContainer5.dart';
import 'package:comm_client/controller/UIController.dart';
import 'package:comm_client/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideScroll extends StatefulWidget {
  const SideScroll({super.key});

  @override
  State<SideScroll> createState() => _SideScrollState();
}

class _SideScrollState extends State<SideScroll> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientController>(builder: ((controller) {
      return GetBuilder<UIController>(builder: (uiController) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(12.5, 14, 20, 14),
          child: Container(
            width: 150,
            height: 332,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: (uiController.widgetFs[0] || uiController.widgetFs[1])
                  ? const AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  // Parent 3
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 6, 0, 14),
                    child: ParentConatainer3(
                        widget: controller.w3!, widgetID: controller.w3ID!),
                  ),
                  // Parent 4
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 6, 0, 14),
                    child: ParentConatainer4(
                        widget: controller.w4!, widgetID: controller.w4ID!),
                  ),
                  // Parent 5
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 6, 0, 14),
                    child:
                        ParentConatainer5(widget: widget, widgetID: "widgetID"),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    }));
  }
}
