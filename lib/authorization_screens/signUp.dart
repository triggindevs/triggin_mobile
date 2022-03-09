// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triggin_app/models/LoginResponse.dart';
import 'package:triggin_app/models/usersignup.dart';
import 'package:triggin_app/webservices/APIs.dart';
import 'package:triggin_app/models/error.dart';
import 'package:http/http.dart' as http;

import '../gst_details.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible = false;

  // for request
  String email = "";
  String name = "";
  String phoneNumber = "";
  String password = "";

  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _phoneFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final GlobalKey<FormState> _SignUpkey = GlobalKey<FormState>();

  void onSubmit(GlobalKey<FormState> SignUpkey) {
    if (SignUpkey.currentState.validate()) {
      userSignupToApplication();
    }
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          child: SizedBox(
            child: Form(
              key: _SignUpkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_bag_rounded,
                              color: Colors.black,
                              size: 30,
                            ),
                            label: const Text(
                              'Triggin',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Phone Number"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Phone Number is Required';
                        } else {
                          return null;
                        }
                      },
                      maxLength: 10,
                      focusNode: _phoneFocusNode,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Name",
                      ),
                      focusNode: _nameFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Name is Required';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "Email"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email is Required';
                          } else {
                            return null;
                          }
                        },
                        focusNode: _emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    title: TextFormField(
                      controller: _passwordController,
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
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
                                _passwordVisible = _passwordVisible;
                              });
                            },
                          ),
                        ),
                        labelText: "Password",
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
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 35,
                                color: Colors.grey,
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  print("user tried to sign up");
                                  userSignupToApplication();
                                },
                                child: RichText(
                                    text: const TextSpan(
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: [
                                      TextSpan(
                                          text: 'or ',
                                          style: TextStyle(
                                              color: Colors.grey)),
                                      TextSpan(
                                          text: 'login to your account',
                                          style: TextStyle(
                                              color: Colors.grey))
                                    ])))
                          ],
                        ),
                        Card(
                          elevation: 4,
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: InkWell(
                            onTap: () {
                              onSubmit(_SignUpkey);
                            },
                            child: const SizedBox(
                              width: 70,
                              height: 70,
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  // for response
  String token = "";
  String message = "";
  bool auth = false;
  User user;

  Future<String> userSignupToApplication() async {
    loadProgress();
    setState(() {
      email = _emailController.text;
      name = _nameController.text;
      phoneNumber = _phoneController.text;
      password = _passwordController.text;

    });
   //  DeviceDetails deviceDetails;
   // // await DeviceUtils.getDeviceDetails().then((value) => deviceDetails = value);
    UserSignUp requestObj = UserSignUp(
        email: email,
        name: name,
        phoneNumber: phoneNumber,
        password: password
        );

    var reqBody = jsonEncode(requestObj);
    print(reqBody.toString());
    var response = await http.post(APIs.signUp,
        headers: {"Content-Type": "application/json"}, body: reqBody);
    if (response.statusCode == 201 || response.statusCode == 200) {
      var _data = json.decode(response.body);
      var _getData = LoginResponse.fromJson(_data);
      token = _getData.token;
      message = _getData.message;
      auth = _getData.auth;
      print("token : $token");
      // saving token to sharedpreferences here
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString('TOKEN', token.toString());

      // updateDeviceToken();
      // TODO : Enable below code Push notifications
      // PushNotificationsManager notificationsManager = PushNotificationsManager();
      // notificationsManager.init().then((value) async {
      //   print('New DeviceId: $value');
      //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      //   await sharedPreferences.setString('DEVICEID', value);
      //   updateDeviceToken(value);
      // });

      //PushNotificationService notificationService = PushNotificationService();
      //notificationService.initialise();
      loadProgress();
      // _modalBottomSheetMenu();
      if (auth = true){
        // TODO : navigate to home screen from here
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GstDetails()),
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

  bool visible = false;
  void loadProgress() {
    if (visible == true) {
      setState(() {
        visible = false;
      });
    } else {
      setState(() {
        visible = true;
      });
    }
  }
}



class PushNotificationsManager {

  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance = PushNotificationsManager._();

  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
 //  bool _initialized = false;

  // Future<String> init() async {
  //   if (_initialized) {
  //     // For iOS request permission first.
  //     _firebaseMessaging.setForegroundNotificationPresentationOptions(alert: true,badge: false,sound: true);
  //
  //
  //     // For testing purposes print the Firebase Messaging token
  //     _initialized = true;
  //   }
  //   return _firebaseMessaging.getToken();
  // }
}

class DeviceDetails {
  String deviceName;
  String deviceVersion;
  String identifier;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceName'] = this.deviceName;
    data['deviceVersion'] = this.deviceVersion;
    data['identifier'] = this.identifier;
    return data;
  }
}
