import 'package:flutter/material.dart';
import 'package:triggin_app/design_files/colors.dart';
import 'package:triggin_app/design_files/text_styles.dart';
import 'package:triggin_app/screens/homepage.dart';
import 'package:triggin_app/widgets/circular_btn.dart';

class GstDetails extends StatefulWidget {
  const GstDetails({Key key}) : super(key: key);

  @override
  _GstDetailsState createState() => _GstDetailsState();
}

class _GstDetailsState extends State<GstDetails> {
  final _gstNoController = TextEditingController();
  final _cgstController = TextEditingController();
  final _sgstController = TextEditingController();

  final _gstNoFocusNode = FocusNode();
  final _cgstFocusNode = FocusNode();
  final _sgstFocusNode = FocusNode();
  final _submitbtnFocusNode = FocusNode();

  final GlobalKey<FormState> _gstdetailskey = GlobalKey<FormState>();
  //Start
  void submitData() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();

    final enteredgstNo = _gstNoController.text;
    final enteredcgst = _cgstController.text;
    final enteredsgst = _sgstController.text;

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const BusinessType()),
    // );
  }

  void onSubmit(GlobalKey<FormState> gstdetailskey) {
    if (gstdetailskey.currentState.validate()) {}
  }

  @override
  void dispose() {
    _gstNoFocusNode.dispose();
    _cgstFocusNode.dispose();
    _sgstFocusNode.dispose();
    _submitbtnFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final bool _keyboardVisible =
    //     WidgetsBinding.instance!.window.viewInsets.bottom > 0.0 ? true : false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: TgnColors.bgColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // constraints variable has the size info
                return Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset('assets/bg_assets/Rectangle.jpg'),
                    ),
                    Column(
                      children: [
                        WidgetsBinding.instance.window.viewInsets.bottom > 0.0?const SizedBox(
                          height: 0.3,
                        ):   SizedBox(
                          // color: Colors.redAccent,
                          height: constraints.maxHeight * 0.077,
                          child: const ListTile(title: Text(' ')),
                        ),
                        SizedBox(
                          height:WidgetsBinding.instance.window.viewInsets.bottom > 0.0? constraints.maxHeight * 0.90:  constraints.maxHeight * 0.77,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxHeight * 0.027,
                              vertical: 8,
                            ),
                            child: Card(
                              margin: EdgeInsets.zero,
                              borderOnForeground: true,
                              elevation: 2,
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child:
                                      Image.asset('assets/bg_assets/Semi.jpg')),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Form(
                                              key: _gstdetailskey,
                                              child: Column(
                                                children: <Widget>[
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.all(10.0),
                                                    child: Image.asset(
                                                        'assets/triggin_icons/self_icons/gst.png'),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  TextFormField(
                                                    controller: _gstNoController,
                                                    decoration: const InputDecoration(
                                                      border: OutlineInputBorder(),
                                                      labelText: "GSTIN No",
                                                    ),
                                                    focusNode: _gstNoFocusNode,
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return 'GSTIN No is Required';
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    keyboardType: TextInputType.text,
                                                    textInputAction:
                                                    TextInputAction.next,
                                                    onFieldSubmitted: (_) {
                                                      _gstNoFocusNode.unfocus();
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                          _cgstFocusNode);
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  LayoutBuilder(builder: (BuildContext
                                                  context,
                                                      BoxConstraints constraints2) {
                                                    // constraints variable has the size info
                                                    return Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                          constraints2.maxWidth /
                                                              2.3,
                                                          //color: Colors.amber,
                                                          child: TextFormField(
                                                            controller:
                                                            _cgstController,
                                                            decoration:
                                                            const InputDecoration(
                                                                border:
                                                                OutlineInputBorder(),
                                                                labelText:
                                                                "CGST%"),
                                                            validator: (value) {
                                                              if (value.isEmpty) {
                                                                return 'CGST is Required';
                                                              } else {
                                                                return null;
                                                              }
                                                            },
                                                            focusNode: _cgstFocusNode,
                                                            keyboardType:
                                                            TextInputType.number,
                                                            textInputAction:
                                                            TextInputAction.next,
                                                            onFieldSubmitted: (_) {
                                                              _cgstFocusNode
                                                                  .unfocus();
                                                              FocusScope.of(context)
                                                                  .requestFocus(
                                                                  _sgstFocusNode);
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                          constraints2.maxWidth /
                                                              2.3,
                                                          // color: Colors.redAccent,
                                                          child: TextFormField(
                                                            controller:
                                                            _sgstController,
                                                            decoration:
                                                            const InputDecoration(
                                                                border:
                                                                OutlineInputBorder(),
                                                                labelText:
                                                                "SGST%"),
                                                            validator: (value) {
                                                              if (value.isEmpty) {
                                                                return 'SGST is Required';
                                                              } else {
                                                                return null;
                                                              }
                                                            },
                                                            focusNode: _sgstFocusNode,
                                                            keyboardType:
                                                            TextInputType.number,
                                                            textInputAction:
                                                            TextInputAction.done,
                                                            onFieldSubmitted: (_) {
                                                              _sgstFocusNode
                                                                  .unfocus();
                                                              FocusScope.of(context)
                                                                  .requestFocus(
                                                                  _submitbtnFocusNode);
                                                            },
                                                          ),
                                                        )
                                                      ],
                                                    );
                                                  }),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text('Next',
                                                      style: TgnTxtStyles.getTxtStyle(
                                                          fontSize: 24)),
                                                  Container(
                                                    margin: const EdgeInsets.only(
                                                        bottom: 2, top: 4),
                                                    height: 5.0,
                                                    width: 80.0,
                                                    color: TgnColors.primaryText,
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                focusNode: _submitbtnFocusNode,
                                                splashColor: TgnColors.bgColor,
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                        const HomePage()),
                                                  );
                                                },
                                                child: const CirGradBtn(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        WidgetsBinding.instance.window.viewInsets.bottom > 0.0?const SizedBox(
                          height: 0.3,
                        ):   SizedBox(
                          //color: Colors.transparent,
                          height: constraints.maxHeight * 0.15,
                        ),
                      ],
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
