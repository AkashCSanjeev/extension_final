import 'package:comm_client/main.dart';
import 'package:flutter/material.dart';

class DisconnectWidget extends StatelessWidget {
  const DisconnectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("ok"),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return MyHomePage();
          }));
        },
      ),
    );
  }
}
