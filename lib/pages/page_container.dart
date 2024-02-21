import 'package:flutter/material.dart';
import 'first_page.dart';
import 'second_page.dart';
//import 'third_page.dart';
import 'page3/third_page_widget.dart';
import 'page3/third_page_model.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class PageContainer extends StatefulWidget {
  const PageContainer({Key? key}) : super(key: key);

  @override
  State<PageContainer> createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  late PageController _pageController;
  Map<String, String> selectedChannels = {};

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void updateSelectedChannels(String channel, String option) {
    setState(() {
      if (selectedChannels.containsKey(channel) &&
          selectedChannels[channel] == option) {
        // If the checkbox is unchecked clear the selection
        selectedChannels.remove(channel);
      } else {
        // Update the selected channel
        selectedChannels[channel] = option;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurple,
      //   title: Container(
      //     padding: const EdgeInsets.only(left: 16.0),
      //     child: const Text(
      //       'BioSync',
      //       style: TextStyle(
      //         fontSize: 20.0,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.looks_one),
      //       onPressed: () {
      //         _pageController.jumpToPage(0);
      //       },
      //     ),
      //     IconButton(
      //       icon: const Icon(Icons.looks_two),
      //       onPressed: () {
      //         _pageController.jumpToPage(1);
      //       },
      //     ),
      //     IconButton(
      //       icon: const Icon(Icons.looks_3),
      //       onPressed: () {
      //         _pageController.jumpToPage(2);
      //       },
      //     ),
      //   ],
      // ),

      //this one kinda new
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'BioSync',
                style: FlutterFlowTheme.of(context).displaySmall,
              ),
            ),
            Expanded(
              flex: 5,
              child: Align(
                alignment: AlignmentDirectional(0, -1),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 1,
                  decoration: BoxDecoration(
                   // color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterFlowIconButton(
                        borderColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: 20,
                        borderWidth: 1,
                        buttonSize: 40,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.bluetooth_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 28,
                        ),
                        onPressed: () {
                          _pageController.jumpToPage(2);
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: 20,
                        borderWidth: 1,
                        buttonSize: 40,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.data_thresholding_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 28,
                        ),
                        onPressed: () {
                          _pageController.jumpToPage(1);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          FirstPage(updateSelectedChannels, selectedChannels),
          SecondPage(selectedChannels),
          ThirdPage(updateSelectedChannels, selectedChannels),
        ],
      ),
    );
  }
}
