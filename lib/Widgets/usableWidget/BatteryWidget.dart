import 'package:comm_client/controller/UIController.dart';
import 'package:comm_client/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BatteryWidget extends StatelessWidget {
  BatteryWidget({
    super.key,
  });

  static String id = "2";
  String parentId = "2";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientController>(builder: (controller) {
      // print("Client is connected ${controller.server!.cilentConnected}");
      // print("Client's connected ${controller.server!.sockets.length}");
      // print("Battery ${controller.w1ParentID}");
      return GetBuilder<UIController>(builder: (uiCOntroller) {
        return Stack(
          children: [
            GetBuilder<UIController>(builder: (uiCOntroller) {
              return Container(
                height: 150,
                width: 150,
                color: Colors.blueAccent,
                margin: const EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    "Battery",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            }),
            Center(
              child: Draggable(
                data: parentId,
                feedback: Container(
                  height: 150,
                  width: 150,
                  color: Colors.black,
                  margin: const EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      "Battery",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                childWhenDragging: Container(
                  height: 150,
                  width: 150,
                  color: Colors.blueGrey,
                  margin: const EdgeInsets.all(5),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  color: const Color.fromARGB(0, 255, 193, 7),
                ),
              ),
            )
          ],
        );
      });
    });
  }
}
