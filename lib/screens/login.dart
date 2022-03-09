import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triggin_app/design_files/colors.dart';
import 'package:triggin_app/design_files/text_styles.dart';
import 'package:triggin_app/gst_details.dart';
import 'package:triggin_app/models/LoginResponse.dart';
import 'package:triggin_app/models/userSignIn.dart';
import 'package:triggin_app/screens/business_type.dart';
import 'package:triggin_app/screens/otp_screen.dart';
import 'package:triggin_app/widgets/circular_btn.dart';
import 'package:triggin_app/webservices/APIs.dart';
import 'package:http/http.dart' as http;
import 'package:triggin_app/models/error.dart';

import 'sign_up.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;

  // signUp request variables
  String phoneNumber = "";
  String password = "";

  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _loginkey = GlobalKey<FormState>();

  void onSubmit(GlobalKey<FormState> _loginkey) {
    if (_loginkey.currentState.validate()) {
      loginApi();
    }
  }

  Future<void> stausDialog(String g) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Status'),
            content: Text(g),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  final _passwordFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    // final tHeight = MediaQuery.of(context).size.height;
    // final tWidth = MediaQuery.of(context).size.width;
    // final double cardPadding = tHeight * 0.15;
    //  final double cardHeight = tHeight * 0.69;
  
    return SafeArea(
      child: Scaffold(
        backgroundColor: TgnColors.bgColor,
        body: Padding(
          padding:  const EdgeInsets.only(top:50.0),
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
                    ):  SizedBox(
                      // color: Colors.redAccent,
                      height: constraints.maxHeight * 0.077,
                      child: const ListTile(title: Text(' ')),
                    ),
                    SizedBox(
                      // color: Colors.amber,
                      height:WidgetsBinding.instance.window.viewInsets.bottom > 0.0? constraints.maxHeight * 0.90:  constraints.maxHeight * 0.77,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8,
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
                                  child: Image.asset('assets/bg_assets/Semi.jpg')),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    WidgetsBinding.instance.window.viewInsets.bottom > 0.0?const SizedBox(
                                      height: 0.3,
                                    ):  Text('LOGO',
                                        style:
                                            TgnTxtStyles.getTxtStyle(fontSize: 36)),
                                    Expanded(
                                      child: Form(
                                        key: _loginkey,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            TextFormField(
                                              maxLength: 10,
                                              controller: _phoneController,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: "91 8089843934"),
                                              //autofocus: true,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Phone Number is Required';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              focusNode: _phoneFocusNode,
                                              keyboardType: TextInputType.phone,
                                              textInputAction: TextInputAction.next,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              controller: _passwordController,
                                              obscureText: _passwordVisible,
                                              decoration: InputDecoration(
                                                border: const OutlineInputBorder(),
                                                hintText: "Password",
                                                suffixIcon: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 5, 0),
                                                  child: IconButton(
                                                    icon: Icon(
                                                      // Based on passwordVisible state choose the icon
                                                      _passwordVisible
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                    ),
                                                    onPressed: () {
                                                      // Update the state i.e. toogle the state of passwordVisible variable
                                                      setState(() {
                                                        _passwordVisible =
                                                            _passwordVisible;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                              focusNode: _passwordFocusNode,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Password is Required';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              keyboardType: TextInputType.text,
                                              textInputAction: TextInputAction.done,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Login',
                                                style: TgnTxtStyles.getTxtStyle(
                                                    fontSize: 24)),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const SignUp()));
                                              },
                                              child: RichText(
                                                  text: TextSpan(
                                                      style: const TextStyle(
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                      children: [
                                                    const TextSpan(
                                                        text: 'Or ',
                                                        style: TextStyle(
                                                          color: TgnColors
                                                              .secondaryText,
                                                        )),
                                                    TextSpan(
                                                      text: 'Create an account',
                                                      style:
                                                          TgnTxtStyles.getTxtStyle(
                                                              fontSize: 16),
                                                    ),
                                                  ])),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 0, top: 4),
                                              height: 5.0,
                                              width: 80.0,
                                              color: TgnColors.primaryText,
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          splashColor: TgnColors.bgColor,
                                          onTap: () {
                                            onSubmit(_loginkey);
                                          },
                                          child: const CirGradBtn(),
                                        ),
                                      ],
                                    )
                                  ,const SizedBox(
                                              height: 20,
                                            ),],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    WidgetsBinding.instance.window.viewInsets.bottom > 0.0?const SizedBox(
                      height: 0.0,
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

  // for response
  String message;

  Future<String> loginApi() async {
      loadProgress();
      setState(() {
        phoneNumber = _phoneController.text;
        password = _passwordController.text;
      });
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String token = sharedPreferences.getString(SharedPrefs.TOKEN);
      //token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MWZmODM5N2M2ZjUzOTU1NTU5ZDQwNjYiLCJwaG9uZU51bWJlciI6IjIyMjIyMjIyMjIiLCJpYXQiOjE2NDY0NTYwOTIsImV4cCI6MTY0NjU0MjQ5Mn0.3n8OoSGz_hHdlZVGsX5uGaQkkS9Z4g2bVeBCSS1U5Po";

      signInRequest requestObj = signInRequest(
          phoneNumber: phoneNumber,
          password: password,
      );

      var reqBody = jsonEncode(requestObj);
      print(reqBody.toString());
      var response = await http.post(APIs.signIn,
          headers: {"Content-Type": "application/json",
            "Authorization": "Bearer $token"},
          body: reqBody);
      print('ststus code $response.statusCode');
      if (response.statusCode == 201 || response.statusCode == 200) {
        var _data = json.decode(response.body);
        var _getData = LoginResponse.fromJson(_data);
        print(_getData.toString());
        message = _getData.message;
        print('message is  $message');
        // updateDeviceToken();
        // TODO : Enable below code Push notifications
        // PushNotificationsManager   notificationsManager = PushNotificationsManager();
        // notificationsManager.init() .then((value) async {
        //   print('New DeviceId: $value');
        //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        //   await sharedPreferences.setString('DEVICEID', value);
        //   updateDeviceToken(value);
        // });

        //PushNotificationService notificationService = PushNotificationService();
        //notificationService.initialise();
        loadProgress();
        // _modalBottomSheetMenu();
        if (message == "logged in successfully"){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OtpScreen()),
        );
      }else {
          Fluttertoast.showToast(msg: message);
        }
      } else {
        loadProgress();
        var _errorJson = json.decode(response.body);
        var _errorRes = Error.fromJSON(_errorJson);
        Fluttertoast.showToast(msg: _errorRes.message);
      }
      return "";

  }

  void loadProgress() {}
}
