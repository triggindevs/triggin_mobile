import 'package:flutter/material.dart';
import 'package:triggin_app/design_files/colors.dart';
import 'package:triggin_app/design_files/text_styles.dart';
import 'package:triggin_app/screens/business_type.dart';
import 'package:triggin_app/widgets/circular_btn.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({Key key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final String _phoneNo = '+ 91 9502065811';
  final _otpController = TextEditingController();

  final _otpFocusNode = FocusNode();
  final _nextBtnFocusNode = FocusNode();

  final GlobalKey<FormState> _otpKey = GlobalKey<FormState>();

  void onSubmit(GlobalKey<FormState> otpKey) {
    if (otpKey.currentState.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BusinessType()),
      );
    }
  }

  @override
  void dispose() {
    _otpFocusNode.dispose();
    _nextBtnFocusNode.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: TgnColors.bgColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            // constraints variable has the size info
            return Stack(
              children: [  Positioned(
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
                            horizontal: constraints.maxHeight * 0.027),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('LOGO',
                                        style: TgnTxtStyles.getTxtStyle(
                                            fontSize: 36)),
                                    Expanded(
                                      child: Form(
                                        key: _otpKey,
                                        child: Center(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                                  child: Text('Enter OTP',
                                                    style: TgnTxtStyles.getTxtStyle(
                                                        fontSize: 24)),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 4),
                                                  child: Text('We’ve sent an OTP to your phone number',
                                                  style:  TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 14,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w400,
                                                      color: TgnColors.otpTxt,
                                                    ),),
                                                ),
                                                Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                                  child: Text(_phoneNo,style:
                                                  TgnTxtStyles.getCWSTxt(
                                                    fontSize: 15,
                                                    weight: FontWeight.bold,
                                                    color: TgnColors.primaryText)
                                                  ,),
                                                ),
                                                TextFormField(
                                                  autofocus: true,
                                                  controller: _otpController,
                                                  decoration:
                                                      const InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    labelText: "Enter OTP",
                                                  ),
                                                  focusNode: _otpFocusNode,
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'OTP is Required';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  onFieldSubmitted: (_) {
                                                    _otpFocusNode.unfocus();
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            _nextBtnFocusNode);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                                                child: Text('Verify OTP',
                                                    style: TgnTxtStyles.getTxtStyle(
                                                        fontSize: 24)),
                                              ),
                                               const Text(
                                                 'Didn’t receive the OTP?',
                                                 style: TextStyle(
                                                   fontFamily: 'Roboto',
                                                   fontSize: 14,
                                                   fontStyle: FontStyle.normal,
                                                   fontWeight: FontWeight.w400,
                                                   color: TgnColors.otpTxt,
                                                 ),
                                               ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: InkWell(
                                                    onTap: () {},
                                                    child: const Text(
                                                      'Resend OTP',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            TgnColors.drawerText2,
                                                      ),
                                                    )),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 0, top: 2),
                                                height: 5.0,
                                                width: 80.0,
                                                color: TgnColors.primaryText,
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            focusNode: _nextBtnFocusNode,
                                            splashColor: TgnColors.bgColor,
                                            onTap: () {
                                              onSubmit(_otpKey);
                                            },
                                            child: const CirGradBtn(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
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
