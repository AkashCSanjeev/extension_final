import 'dart:async';

import 'package:comm_client/MainColoumn.dart';
import 'package:comm_client/SideScroll.dart';
import 'package:comm_client/controller/UIController.dart';
import 'package:comm_client/controller/controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ExtendedScreen extends StatefulWidget {
  const ExtendedScreen({super.key});

  @override
  State<ExtendedScreen> createState() => _ExtendedScreenState();
}

class _ExtendedScreenState extends State<ExtendedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<ClientController>(
            init: ClientController(),
            builder: (controller) {
              return GetBuilder<UIController>(
                  init: UIController(),
                  builder: (uiController) {
                    return Container(
                      width: uiController.width,
                      height: uiController.height,
                      color: Colors.black,
                      child: Row(
                        children: [
                          // Main Componets Screen
                          MainColumn(),
                          // SIde Components Screen
                          SideScroll()
                        ],
                      ),
                    );
                  });
            }));
  }
}
