import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/widgets/status_bar.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '../../widgets/configuring_session.dart';
import 'third_page_model.dart';
export 'third_page_model.dart';

class ThirdPage extends StatefulWidget {
  final Function(String, String) updateSelectedChannels;
  final Map<String, String> selectedChannels;

  const ThirdPage(this.updateSelectedChannels, this.selectedChannels,
      {Key? key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late ThirdPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThirdPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.49,
                              height: MediaQuery.sizeOf(context).height * 0.6,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 12,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 5),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  width: 0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height * 1,
                                      decoration: BoxDecoration(
                                        color: Color(0xFA4BB168),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(0),
                                        ),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0xFA4BB168),
                                          width: 1000,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 25,
                                    child: Container(
                                      width: 100,
                                      height:
                                          MediaQuery.sizeOf(context).height * 1,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, -1),
                                            child: Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Text(
                                                'Bluetooth Connection',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.45,
                              height: MediaQuery.sizeOf(context).height * 0.6,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 12,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 5),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height * 1,
                                      decoration: BoxDecoration(
                                        color: Color(0xFA4BB168),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 25,
                                    child: Container(
                                      width: 100,
                                      height:
                                          MediaQuery.sizeOf(context).height * 1,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, -1),
                                            child: Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Text(
                                                'Configuring Session',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1,
                                              // decoration: BoxDecoration(
                                              //   // color:
                                              //   //     FlutterFlowTheme.of(context)
                                              //   //         .primaryBackground,
                                              // ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: ConfiguringSession(widget
                                                  .updateSelectedChannels),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.66,
                              height: MediaQuery.sizeOf(context).height * 0.23,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 12,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 5),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 4,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, -1),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20, 0, 0, 0),
                                                      child: Text(
                                                        'Sensors Status',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontSize: 30,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.8,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1,
                                                    // decoration: BoxDecoration(
                                                    //   color:
                                                    //       FlutterFlowTheme.of(
                                                    //               context)
                                                    //           .tertiary,
                                                    // ),
                                                    child: StatusBar(
                                                        selectedChannels: widget.selectedChannels,),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(
                                            thickness: 3,
                                            color: Color(0xFA4BB168),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, -1),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 20, 0),
                                                      child: Text(
                                                        'Bluetooth Status',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontSize: 30,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  flex: 3,
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Column(
                      //   mainAxisSize: MainAxisSize.max,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Flexible(
                      //       child: Container(
                      //         width: MediaQuery.sizeOf(context).width * 0.66,
                      //         height: MediaQuery.sizeOf(context).height * 0.23,
                      //         decoration: BoxDecoration(
                      //           color: FlutterFlowTheme.of(context)
                      //               .primaryBackground,
                      //           boxShadow: [
                      //             BoxShadow(
                      //               blurRadius: 12,
                      //               color: Color(0x33000000),
                      //               offset: Offset(0, 5),
                      //             )
                      //           ],
                      //           borderRadius: BorderRadius.circular(20),
                      //           border: Border.all(
                      //             color: FlutterFlowTheme.of(context)
                      //                 .primaryBackground,
                      //             width: 4,
                      //           ),
                      //         ),
                      //         child: Column(
                      //           mainAxisSize: MainAxisSize.max,
                      //           children: [
                      //             Flexible(
                      //               child: Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     0, 10, 0, 0),
                      //                 child: Row(
                      //                   mainAxisSize: MainAxisSize.max,
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.center,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.end,
                      //                   children: [
                      //                     Flexible(
                      //                       child: Align(
                      //                         alignment:
                      //                             AlignmentDirectional(0, -1),
                      //                         child: Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(20, 0, 0, 0),
                      //                           child: Text(
                      //                             'Sensors Status',
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .headlineMedium
                      //                                 .override(
                      //                                   fontFamily: 'Outfit',
                      //                                   fontSize: 30,
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),

                      //                     VerticalDivider(
                      //                       thickness: 3,
                      //                       color: Color(0xFA4BB168),
                      //                     ),
                      //                     Expanded(
                      //                       child: Align(
                      //                         alignment:
                      //                             AlignmentDirectional(0, -1),
                      //                         child: Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(0, 0, 20, 0),
                      //                           child: Text(
                      //                             'Bluetooth Status',
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .headlineMedium
                      //                                 .override(
                      //                                   fontFamily: 'Outfit',
                      //                                   fontSize: 30,
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.28,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.23,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 12,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 4,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional(0, -1),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Text(
                                            'Documentation',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional(0, -1),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'Go to User Manual',
                                          options: FFButtonOptions(
                                            height: 40,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24, 0, 24, 0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            color: Color(0xFA4BB169),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 3,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class ThirdPage extends StatefulWidget {
//   const ThirdPage({super.key});

//   @override
//   State<ThirdPage> createState() => _ThirdPageState();
// }

// class _ThirdPageState extends State<ThirdPage> {
//   late ThirdPageModel _model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => ThirdPageModel());
//   }

//   @override
//   void dispose() {
//     _model.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isiOS) {
//       SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle(
//           statusBarBrightness: Theme.of(context).brightness,
//           systemStatusBarContrastEnforced: true,
//         ),
//       );
//     }

//     return GestureDetector(
//       onTap: () => _model.unfocusNode.canRequestFocus
//           ? FocusScope.of(context).requestFocus(_model.unfocusNode)
//           : FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).alternate,
//         // appBar: AppBar(
//         //   backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         //   automaticallyImplyLeading: false,
//         //   title: Row(
//         //     mainAxisSize: MainAxisSize.max,
//         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //     crossAxisAlignment: CrossAxisAlignment.center,
//         //     children: [
//         //       Text(
//         //         'BioSync',
//         //         style: FlutterFlowTheme.of(context).displaySmall,
//         //       ),
//         //       Expanded(
//         //         child: Align(
//         //           alignment: AlignmentDirectional(0, 0),
//         //           child: Padding(
//         //             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 70, 0),
//         //             child: Container(
//         //               width: MediaQuery.sizeOf(context).width * 0.07,
//         //               height: 100,
//         //               decoration: BoxDecoration(
//         //                 color: FlutterFlowTheme.of(context).primaryBackground,
//         //               ),
//         //               alignment: AlignmentDirectional(0, 0),
//         //               child: Row(
//         //                 mainAxisSize: MainAxisSize.max,
//         //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //                 children: [
//         //                   Expanded(
//         //                     child: Column(
//         //                       mainAxisSize: MainAxisSize.max,
//         //                       mainAxisAlignment: MainAxisAlignment.center,
//         //                       children: [
//         //                         Icon(
//         //                           Icons.bluetooth_rounded,
//         //                           color:
//         //                               FlutterFlowTheme.of(context).primaryText,
//         //                           size: 35,
//         //                         ),
//         //                         Divider(
//         //                           thickness: 4,
//         //                           color: Color(0xFA4BB168),
//         //                         ),
//         //                       ],
//         //                     ),
//         //                   ),
//         //                   Expanded(
//         //                     child: Column(
//         //                       mainAxisSize: MainAxisSize.max,
//         //                       mainAxisAlignment: MainAxisAlignment.center,
//         //                       children: [
//         //                         Icon(
//         //                           Icons.data_thresholding_outlined,
//         //                           color:
//         //                               FlutterFlowTheme.of(context).primaryText,
//         //                           size: 35,
//         //                         ),
//         //                         Divider(
//         //                           thickness: 4,
//         //                           color: Color(0xFA4BB168),
//         //                         ),
//         //                       ],
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //             ),
//         //           ),
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         //   actions: [],
//         //   centerTitle: true,
//         //   elevation: 4,
//         // ),
//         body: SafeArea(
//           top: true,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
//                             child: Container(
//                               width: MediaQuery.sizeOf(context).width * 0.49,
//                               height: MediaQuery.sizeOf(context).height * 0.6,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context)
//                                     .primaryBackground,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 12,
//                                     color: Color(0x33000000),
//                                     offset: Offset(0, 5),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(
//                                   color: FlutterFlowTheme.of(context)
//                                       .secondaryBackground,
//                                   width: 0,
//                                 ),
//                               ),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       height:
//                                           MediaQuery.sizeOf(context).height * 1,
//                                       decoration: BoxDecoration(
//                                         color: Color(0xFA4BB168),
//                                         borderRadius: BorderRadius.only(
//                                           bottomLeft: Radius.circular(20),
//                                           bottomRight: Radius.circular(0),
//                                           topLeft: Radius.circular(20),
//                                           topRight: Radius.circular(0),
//                                         ),
//                                         shape: BoxShape.rectangle,
//                                         border: Border.all(
//                                           color: Color(0xFA4BB168),
//                                           width: 1000,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 25,
//                                     child: Container(
//                                       width: 100,
//                                       height:
//                                           MediaQuery.sizeOf(context).height * 1,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme.of(context)
//                                             .primaryBackground,
//                                         borderRadius: BorderRadius.only(
//                                           bottomLeft: Radius.circular(0),
//                                           bottomRight: Radius.circular(20),
//                                           topLeft: Radius.circular(0),
//                                           topRight: Radius.circular(20),
//                                         ),
//                                       ),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.max,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: [
//                                           Align(
//                                             alignment:
//                                                 AlignmentDirectional(0, -1),
//                                             child: Padding(
//                                               padding: EdgeInsets.all(20),
//                                               child: Text(
//                                                 'Bluetooth Connection',
//                                                 textAlign: TextAlign.start,
//                                                 style:
//                                                     FlutterFlowTheme.of(context)
//                                                         .headlineMedium
//                                                         .override(
//                                                           fontFamily: 'Outfit',
//                                                           fontSize: 40,
//                                                           fontWeight:
//                                                               FontWeight.w800,
//                                                         ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Flexible(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
//                             child: Container(
//                               width: MediaQuery.sizeOf(context).width * 0.45,
//                               height: MediaQuery.sizeOf(context).height * 0.6,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context)
//                                     .primaryBackground,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 12,
//                                     color: Color(0x33000000),
//                                     offset: Offset(0, 5),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Expanded(
//                                     child: Container(
//                                       height:
//                                           MediaQuery.sizeOf(context).height * 1,
//                                       decoration: BoxDecoration(
//                                         color: Color(0xFA4BB168),
//                                         borderRadius: BorderRadius.only(
//                                           bottomLeft: Radius.circular(20),
//                                           bottomRight: Radius.circular(0),
//                                           topLeft: Radius.circular(20),
//                                           topRight: Radius.circular(0),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 25,
//                                     child: Container(
//                                       width: 100,
//                                       height:
//                                           MediaQuery.sizeOf(context).height * 1,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme.of(context)
//                                             .primaryBackground,
//                                         borderRadius: BorderRadius.only(
//                                           bottomLeft: Radius.circular(0),
//                                           bottomRight: Radius.circular(20),
//                                           topLeft: Radius.circular(0),
//                                           topRight: Radius.circular(20),
//                                         ),
//                                       ),
//                                       child: Align(
//                                         alignment: AlignmentDirectional(0, -1),
//                                         child: Padding(
//                                           padding: EdgeInsets.all(20),
//                                           child: Text(
//                                             'Configuring Session',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .headlineMedium
//                                                 .override(
//                                                   fontFamily: 'Outfit',
//                                                   fontSize: 40,
//                                                   fontWeight: FontWeight.w800,
//                                                 ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Align(
//                   alignment: AlignmentDirectional(0, 0),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Column(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Flexible(
//                             child: Container(
//                               width: MediaQuery.sizeOf(context).width * 0.66,
//                               height: MediaQuery.sizeOf(context).height * 0.23,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context)
//                                     .primaryBackground,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 12,
//                                     color: Color(0x33000000),
//                                     offset: Offset(0, 5),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(
//                                   color: FlutterFlowTheme.of(context)
//                                       .primaryBackground,
//                                   width: 4,
//                                 ),
//                               ),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Flexible(
//                                     child: Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 10, 0, 0),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.end,
//                                         children: [
//                                           Flexible(
//                                             child: Align(
//                                               alignment:
//                                                   AlignmentDirectional(0, -1),
//                                               child: Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(20, 0, 0, 0),
//                                                 child: Text(
//                                                   'Sensors Status',
//                                                   style: FlutterFlowTheme.of(
//                                                           context)
//                                                       .headlineMedium
//                                                       .override(
//                                                         fontFamily: 'Outfit',
//                                                         fontSize: 30,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                       ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           VerticalDivider(
//                                             thickness: 3,
//                                             color: Color(0xFA4BB168),
//                                           ),
//                                           Expanded(
//                                             child: Align(
//                                               alignment:
//                                                   AlignmentDirectional(0, -1),
//                                               child: Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(0, 0, 20, 0),
//                                                 child: Text(
//                                                   'Bluetooth Status',
//                                                   style: FlutterFlowTheme.of(
//                                                           context)
//                                                       .headlineMedium
//                                                       .override(
//                                                         fontFamily: 'Outfit',
//                                                         fontSize: 30,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                       ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Flexible(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Flexible(
//                               child: Container(
//                                 width: MediaQuery.sizeOf(context).width * 0.28,
//                                 height:
//                                     MediaQuery.sizeOf(context).height * 0.23,
//                                 decoration: BoxDecoration(
//                                   color: FlutterFlowTheme.of(context)
//                                       .primaryBackground,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       blurRadius: 12,
//                                       color: Color(0x33000000),
//                                       offset: Offset(0, 5),
//                                     )
//                                   ],
//                                   borderRadius: BorderRadius.circular(20),
//                                   border: Border.all(
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryBackground,
//                                     width: 4,
//                                   ),
//                                 ),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Expanded(
//                                       child: Align(
//                                         alignment: AlignmentDirectional(0, -1),
//                                         child: Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 10, 0, 0),
//                                           child: Text(
//                                             'Documentation',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .headlineMedium
//                                                 .override(
//                                                   fontFamily: 'Outfit',
//                                                   fontSize: 30,
//                                                   fontWeight: FontWeight.w800,
//                                                 ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Align(
//                                         alignment: AlignmentDirectional(0, -1),
//                                         child: FFButtonWidget(
//                                           onPressed: () {
//                                             print('Button pressed ...');
//                                           },
//                                           text: 'Go to User Manual',
//                                           options: FFButtonOptions(
//                                             height: 40,
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     24, 0, 24, 0),
//                                             iconPadding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 0, 0),
//                                             color: Color(0xFA4BB169),
//                                             textStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .titleSmall
//                                                     .override(
//                                                       fontFamily: 'Readex Pro',
//                                                       color: Colors.white,
//                                                     ),
//                                             elevation: 3,
//                                             borderSide: BorderSide(
//                                               color: Colors.transparent,
//                                               width: 1,
//                                             ),
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

