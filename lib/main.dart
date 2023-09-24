import 'package:comm_client/ExtendedScreen.dart';
import 'package:comm_client/controller/controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var networkStatus = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      switch (result) {
        case ConnectivityResult.wifi:
          print("Wifi");

          // getIpAdd();

          break;
        default:
          // if (clientModel != null) {
          // clientModel!.disconnect();
          // Navigator.pushReplacement(Get.context!,
          //     MaterialPageRoute(builder: (context) {
          //   return ExtendedScreen();
          // }));
          // Get.dialog(DisconnectWidget());
          // }
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Not connected to wifi")));
          print("Not Connected to wifi");
      }
    });
    return Scaffold(
        body: GetBuilder<ClientController>(
      init: ClientController(),
      builder: (controller) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: controller.address == null
                    ? Text("No device found")
                    : TextButton(
                        onPressed: () async {
                          await controller.clientModel!.connect();
                          print(
                              "Client ${controller.clientModel!.isConnected}");
                          if (controller.clientModel!.isConnected) {
                            // controller.context = context;
                            final info = await deviceInfo.androidInfo;
                            print(controller.clientModel);
                            print(controller.clientModel!.hostname);
                            controller.clientModel!
                                .write("${info.brand} ${info.device} c");
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ExtendedScreen();
                            }));
                          }

                          setState(() {});
                        },
                        child: Text(
                            "${controller.address!.ip} ${controller.clientModel!.isConnected}"),
                      ),
              ),
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Searching")));
                    controller.getIpAdd();
                    if (controller.address == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Center(
                        child: Column(
                          children: [
                            Text("Couldn't find a server"),
                            ElevatedButton(
                                onPressed: controller.getIpAdd,
                                child: Text("Try Again"))
                          ],
                        ),
                      )));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Found Server")));
                    }
                  },
                  child: Text("Search")),
              ElevatedButton(
                  onPressed: () async {
                    final info = await deviceInfo.androidInfo;
                    controller.clientModel!.disconnect();
                    controller.address = null;
                    controller.logs.clear();
                    setState(() {});
                  },
                  child: Text("Disconnect")),
            ],
          ),
        );
      },
    ));
    // body: ExtendedScreen()
  }
}
