import 'package:flutter/material.dart';

class StatusBar extends StatefulWidget {
  final Map<String, String> selectedChannels;

  const StatusBar({
    required this.selectedChannels,
    Key? key,
  }) : super(key: key);

  @override
  _StatusBarState createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  @override
  Widget build(BuildContext context) {
    // Get a list of active sensors based on selected channels
    List<String> activeSensors = widget.selectedChannels.values.toList();
    //print("in status bar");
    //print(activeSensors);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Wrap the Text widget with Flexible to ensure it fits within the available space
          Flexible(
            child: Text(
              'Active Sensors: ${activeSensors.join(', ')}',
              overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
            ),
          ),
        ],
      ),
    );
  }
}
