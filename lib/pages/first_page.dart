import 'package:flutter/material.dart';
import '../widgets/configuring_session.dart';
import '../widgets/documentation_widget.dart';
import '../widgets/status_bar.dart';

class FirstPage extends StatelessWidget {
  final Function(String, String) updateSelectedChannels;
  final Map<String, String> selectedChannels;

  const FirstPage(this.updateSelectedChannels, this.selectedChannels,
      {Key? key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  ConfiguringSession(updateSelectedChannels),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: DocumentationWidget(),
                  ),
                ],
              ),
            ),
          ),
          StatusBar(
            selectedChannels: selectedChannels,
           // isBluetoothConnected:
             //   false, //Change this based on ACTUAL Bluetooth status
          ),
        ],
      ),
    );
  }
}
