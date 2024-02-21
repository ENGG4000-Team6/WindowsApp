import 'package:flutter/material.dart';

class ConfiguringSession extends StatefulWidget {
  final Function(String, String) updateSelectedChannels;

  const ConfiguringSession(this.updateSelectedChannels, {Key? key})
      : super(key: key);

  @override
  _ConfiguringSessionState createState() => _ConfiguringSessionState();
}

class _ConfiguringSessionState extends State<ConfiguringSession>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool isChannel1EMGSelected = false;
  bool isChannel1ECGSelected = false;
  bool isChannel2EMGSelected = false;
  bool isChannel2ECGSelected = false;
  bool isChannel3EOGSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: buildChannelSelection('Channel 1', 'EMG', 'ECG'),
            ),
            Expanded(
              child: buildChannelSelection('Channel 2', 'EMG', 'ECG'),
            ),
            Expanded(
              child: buildChannelSelection('Channel 3', 'EOG', null),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print(
                    'Channel 1: EMG - $isChannel1EMGSelected, ECG - $isChannel1ECGSelected');
                print(
                    'Channel 2: EMG - $isChannel2EMGSelected, ECG - $isChannel2ECGSelected');
                print('Channel 3: EOG - $isChannel3EOGSelected');
              },
              child: const Text('Start Session'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChannelSelection(
      String channel, String option1, String? option2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$channel Signal Type:',
          style: TextStyle(fontSize: 18), // Adjust the text size here
        ),
        Row(
          children: [
            Expanded(
              child: buildRadioButton(channel, option1),
            ),
            if (option2 != null) ...[
              const SizedBox(width: 8),
              Expanded(
                child: buildRadioButton(channel, option2),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget buildRadioButton(String channel, String option) {
    bool isSelected = getSelectionState(channel, option);
    print("in buildRadio");
    return Row(
      children: [
        Checkbox(
          value: isSelected,
          onChanged: (value) {
            print("inon changed");
            setState(() {
              if (value != null) {
                print("in if");
                updateSelectionState(channel, option, value);
                widget.updateSelectedChannels(channel, option);
              }
            });
          },
        ),
        Text(
          option,
          style: TextStyle(fontSize: 16), // Adjust the text size here
        ),
      ],
    );
  }

  bool getSelectionState(String channel, String option) {
    switch ('$channel-$option') {
      case 'Channel 1-EMG':
        return isChannel1EMGSelected;
      case 'Channel 1-ECG':
        return isChannel1ECGSelected;
      case 'Channel 2-EMG':
        return isChannel2EMGSelected;
      case 'Channel 2-ECG':
        return isChannel2ECGSelected;
      case 'Channel 3-EOG':
        return isChannel3EOGSelected;
      default:
        return false;
    }
  }

  void updateSelectionState(String channel, String option, bool value) {
    switch ('$channel-$option') {
      case 'Channel 1-EMG':
        if (value) {
          isChannel1EMGSelected = value;
          isChannel1ECGSelected = !value;
        } else {
          isChannel1EMGSelected = false;
        }
        break;
      case 'Channel 1-ECG':
        if (value) {
          isChannel1ECGSelected = value;
          isChannel1EMGSelected = !value;
        } else {
          isChannel1ECGSelected = false;
        }
        break;
      case 'Channel 2-EMG':
        if (value) {
          isChannel2EMGSelected = value;
          isChannel2ECGSelected = !value;
        } else {
          isChannel2EMGSelected = false;
        }
        break;
      case 'Channel 2-ECG':
        if (value) {
          isChannel2ECGSelected = value;
          isChannel2EMGSelected = !value;
        } else {
          isChannel2ECGSelected = false;
        }
        break;
      case 'Channel 3-EOG':
        if (value) {
          isChannel3EOGSelected = value;
        } else {
          isChannel3EOGSelected = false;
        }
        break;
    }
  }
}
