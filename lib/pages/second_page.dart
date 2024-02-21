import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';
import 'package:csv/csv.dart';
import 'dart:io';


class SecondPage extends StatefulWidget {
  final Map<String, String> selectedChannels;

  const SecondPage(this.selectedChannels, {super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<Timer> timers = []; // Define timers list
  List<FlSpot> emgLiveData = [];
  List<FlSpot> ecgLiveData = [];
  List<FlSpot> eogLiveData = [];

  final int maxDataPoints = 100;

  // checkbox state
  bool showChannel1 = true;
  bool showChannel2 = true;
  bool showChannel3 = true;

  //@override
  int currentDataIndex = 0;

  @override
  void initState() {
    super.initState();
    readDataFromFileForSignalType('emg.csv', 'EMG');
    readDataFromFileForSignalType('ecg.csv', 'ECG');
    readDataFromFileForSignalType('eog.csv', 'EOG');
  }

  Future<void> readDataFromFileForSignalType(
      String fileName, String signalType) async {
    try {
      final File file = File(fileName);
      List<List<dynamic>> rows = const CsvToListConverter().convert(
        await file.readAsString(),
        shouldParseNumbers: false,
      );

      List<FlSpot> channelLiveData = List.generate(maxDataPoints, (index) {
        // Calculate the initial x-value
        double initialXValue = maxDataPoints.toDouble() - index.toDouble() - 1;
        return FlSpot(initialXValue, 0);
      });

      Timer timer =
          Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
        setState(() {
          if (currentDataIndex < rows.length) {
            double value = double.parse(rows[currentDataIndex][0].toString());

            channelLiveData[maxDataPoints - 1] =
                FlSpot(currentDataIndex.toDouble() + 999, value);

            for (int i = 0; i < maxDataPoints - 1; i++) {
              channelLiveData[i] =
                  FlSpot((i + 1).toDouble(), channelLiveData[i + 1].y);
            }

            currentDataIndex++;

            if (channelLiveData.length > maxDataPoints) {
              channelLiveData.removeAt(0);
            }
          } else {
            t.cancel();
          }
        });
      });

      timers.add(timer);

      switch (signalType) {
        case 'EMG':
          emgLiveData = channelLiveData;
          break;
        case 'ECG':
          ecgLiveData = channelLiveData;
          break;
        case 'EOG':
          eogLiveData = channelLiveData;
          break;
      }
    } catch (e) {
      print('Error reading data from file $fileName: $e');
    }
  }

  bool userShowChannel1 = false;
  bool userShowChannel2 = false;
  bool userShowChannel3 = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // Store selectedChannels to use in builfPlotWidget
    final Map<String, String> selectedChannels = widget.selectedChannels;
    String channel1 = widget.selectedChannels['Channel 1'] ?? '';
    String channel2 = widget.selectedChannels['Channel 2'] ?? '';
    String channel3 = widget.selectedChannels['Channel 3'] ?? '';

    // Check which channels have options enabled
    showChannel1 = channel1.isNotEmpty;
    showChannel2 = channel2.isNotEmpty;
    showChannel3 = channel3.isNotEmpty;

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              // Signal Acquisition Widget
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Signal Acquisition',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      //build Channel 1 (based on checkbox state)
                      if (showChannel1) ...[
                        Column(
                          children: [
                            const Text('Channel 1'),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const SizedBox(width: 16),
                                Checkbox(
                                  value: userShowChannel1,
                                  onChanged: (value) {
                                    setState(() {
                                      // Toggle when checkbox clicked
                                      userShowChannel1 = value!;
                                      print("channel 1 checkbox hit");
                                    });
                                  },
                                ),
                                if (showChannel1) const Text('Show Plot'),
                              ],
                            ),
                          ],
                        ),
                      ],
                      // build Channel 2 (based on checkbox state)
                      if (showChannel2) ...[
                        Column(
                          children: [
                            const Text('Channel 2'),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const SizedBox(width: 16),
                                Checkbox(
                                  value: userShowChannel2,
                                  onChanged: (value) {
                                    setState(() {
                                      userShowChannel2 = value!;
                                    });
                                  },
                                ),
                                if (showChannel2) const Text('Show Plot'),
                              ],
                            ),
                          ],
                        ),
                      ],
                      // Build Channel 3 (based on checkbox state))
                      if (showChannel3) ...[
                        Column(
                          children: [
                            const Text('Channel 3'),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const SizedBox(width: 16),
                                Checkbox(
                                  value: userShowChannel3,
                                  onChanged: (value) {
                                    setState(() {
                                      userShowChannel3 = value!;
                                    });
                                  },
                                ),
                                if (showChannel3) const Text('Show Plot'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Graph Widgets
              Expanded(
                child: Column(
                  children: [
                    if (userShowChannel1)
                      buildPlotWidget(
                          'Channel 1',
                          userShowChannel1
                              ? (selectedChannels['Channel 1'] == 'EMG'
                                  ? emgLiveData
                                  : ecgLiveData)
                              : []),
                    if (userShowChannel2)
                      buildPlotWidget(
                          'Channel 2',
                          userShowChannel2
                              ? (selectedChannels['Channel 2'] == 'EMG'
                                  ? emgLiveData
                                  : ecgLiveData)
                              : []),
                    if (userShowChannel3)
                      buildPlotWidget('Channel 3', eogLiveData),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isPaused = false;
  Map<String, List<FlSpot>> frozenData = {};

  List<FlSpot> applyMovingAverage(List<FlSpot> data, int windowSize) {
    List<FlSpot> smoothedData = [];
    for (int i = 0; i < data.length; i++) {
      double sum = 0;
      int count = 0;
      for (int j = i; j >= 0 && j > i - windowSize; j--) {
        sum += data[j].y;
        count++;
      }
      smoothedData.add(FlSpot(data[i].x, sum / count));
    }
    return smoothedData;
  }

  Widget buildPlotWidget(String channelIndex, List<FlSpot> liveData) {
    print('LiveData in buildPlotWidget: $liveData');
    List<FlSpot> channelLiveData;
    switch (channelIndex) {
      case 'Channel 1':
        channelLiveData = userShowChannel1 ? liveData : [];
        break;
      case 'Channel 2':
        channelLiveData = userShowChannel2 ? liveData : [];
        break;
      case 'Channel 3':
        channelLiveData = userShowChannel3 ? liveData : [];
        break;
      default:
        channelLiveData = [];
        break;
    }

    List<FlSpot> smoothedData =
        applyMovingAverage(channelLiveData, 25); // Adjust windowSize as needed
    List<FlSpot> displayData =
        isPaused ? frozenData[channelIndex] ?? [] : List.from(smoothedData);

    // double minY = displayData.isNotEmpty
    //     ? displayData.map((spot) => spot.y).reduce((a, b) => a < b ? a : b)
    //     : 0;

    // double maxY = displayData.isNotEmpty
    //     ? displayData
    //         .where((spot) => spot.y != 0)
    //         .map((spot) => spot.y)
    //         .reduce((a, b) => a > b ? a : b)
    //     : 35;

    // // Calculate the range of the signal
    // double signalRange = maxY - minY;

    // // Adjust minY and maxY to take up 80% of the available height
    // minY = minY - 0.15 * signalRange;
    // maxY = maxY + 0.15 * signalRange;

    double minY = 0;
    double maxY = 35;

    double signalRange = maxY - minY;
    double percentageThreshold =
        0.6; // Adjust the threshold percentage as needed

    if (displayData.isNotEmpty) {
      double currentMinY =
          displayData.map((spot) => spot.y).reduce((a, b) => a < b ? a : b);
      double currentMaxY = displayData
          .where((spot) => spot.y != 0)
          .map((spot) => spot.y)
          .reduce((a, b) => a > b ? a : b);

      // Calculate the range of the current signal
      double currentSignalRange = currentMaxY - currentMinY;

      // Check if the change in signal range is greater than the threshold percentage
      if (currentSignalRange > signalRange * (1 + percentageThreshold) ||
          currentSignalRange < signalRange * (1 - percentageThreshold)) {
        // Adjust minY and maxY to take up 80% of the available height
        minY = currentMinY - 0.15 * currentSignalRange;
        maxY = currentMaxY + 0.15 * currentSignalRange;

        // Update the overall signal range
        signalRange = currentSignalRange;
      }
    }

    return Column(
      children: [
        if ((channelIndex == 'Channel 1' && userShowChannel1) ||
            (channelIndex == 'Channel 2' && userShowChannel2) ||
            (channelIndex == 'Channel 3' && userShowChannel3))
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                LineChart(
                  LineChartData(
                    // titlesData: FlTitlesData(
                    //   leftTitles: SideTitles(showTitles: false),
                    //   rightTitles: SideTitles(showTitles: true),
                    //   bottomTitles: SideTitles(showTitles: false),
                    //   topTitles: SideTitles(showTitles: false),
                    // ),
                    minX: 0,
                    maxX: maxDataPoints.toDouble() - 1,
                    minY: minY,
                    maxY: maxY,
                    lineBarsData: [
                      LineChartBarData(
                        spots: displayData,
                        isCurved: false,
                        // colors: [Colors.blue],
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                        preventCurveOverShooting: false,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 0,
                  child: Text(
                    channelIndex,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  right: 54,
                  top: 4,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        isPaused = !isPaused;
                        if (isPaused) {
                          // Save current live data to frozenData
                          frozenData[channelIndex] = List.from(channelLiveData);
                        }
                      });
                    },
                    mini: true,
                    child: Icon(isPaused ? Icons.play_arrow : Icons.pause),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    // Cancel all timers
    for (Timer timer in timers) {
      timer.cancel();
    }
    super.dispose();
  }
}
