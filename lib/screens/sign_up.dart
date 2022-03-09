import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triggin_app/design_files/colors.dart';
import 'package:triggin_app/design_files/text_styles.dart';
import 'package:triggin_app/models/LoginResponse.dart';
import 'package:triggin_app/models/usersignup.dart';
import 'package:triggin_app/screens/business_type.dart';
import 'package:triggin_app/webservices/APIs.dart';
import 'package:triggin_app/widgets/circular_btn.dart';
import 'package:triggin_app/models/error.dart';
import 'package:http/http.dart' as http;
import '../gst_details.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible = false;
  final formKey = GlobalKey<FormState>();
  // signUp request variables
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
 final _submitbtnFocusNode = FocusNode();


  void onSubmit(GlobalKey<FormState> form) {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      callSignUpApi();
    }
  }


  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _submitbtnFocusNode.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    // final bool _keyboardVisible =
    //     WidgetsBinding.instance.window.viewInsets.bottom > 0.0 ? true : false;
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
                    ):    SizedBox(
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
                        vertical: 8),
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
                                    WidgetsBinding.instance.window.viewInsets.bottom > 0.0?const SizedBox(
                                      height: 0.3,
                                    ):    Text('LOGO',
                                        style: TgnTxtStyles.getTxtStyle(
                                            fontSize: 36)),
                                    Expanded(
                                      child: Form(
                                        key:  formKey,
                                        child: Center(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: <Widget>[
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                TextFormField(
                                                  autofocus: true,
                                                  controller: _nameController,
                                                  decoration:
                                                      const InputDecoration(
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
                                                  keyboardType:
                                                      TextInputType.text,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  onFieldSubmitted: (_) {
                                                    _nameFocusNode.unfocus();
                                                    FocusScope.of(context)
                                                        .requestFocus(_phoneFocusNode);
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                TextFormField(
                                                  controller: _phoneController,
                                                  decoration:
                                                      const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          labelText:
                                                              "Phone Number"),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Phone Number is Required';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  maxLength: 10,
                                                  focusNode: _phoneFocusNode,
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                       onFieldSubmitted: (_) {
                                                    _phoneFocusNode.unfocus();
                                                    FocusScope.of(context)
                                                        .requestFocus(_emailFocusNode);
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                TextFormField(
                                                  controller: _emailController,
                                                  decoration:
                                                      const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          labelText: "Email"),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Email is Required';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  focusNode: _emailFocusNode,
                                                  keyboardType:
                                                      TextInputType.emailAddress,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                      onFieldSubmitted: (_) {
                                                    _emailFocusNode.unfocus();
                                                    FocusScope.of(context)
                                                        .requestFocus(_passwordFocusNode);
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                TextFormField(
                                                  controller: _passwordController,
                                                  obscureText: _passwordVisible,
                                                  decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(),
                                                    hintText: "Password",
                                                    suffixIcon: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 0, 5, 0),
                                                      child: IconButton(
                                                        icon: Icon(
                                                          // Based on passwordVisible state choose the icon
                                                          _passwordVisible
                                                              ? Icons
                                                                  .visibility_off
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
                                                  keyboardType:
                                                      TextInputType.text,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                        onFieldSubmitted: (_) {
                                                    _passwordFocusNode.unfocus();
                                                    FocusScope.of(context)
                                                        .requestFocus(_submitbtnFocusNode);
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical:  5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Sign Up',
                                                  style: TgnTxtStyles.getTxtStyle(
                                                      fontSize: 24)),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Login()));
                                                },
                                                child: RichText(
                                                    text: TextSpan(
                                                        style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                                        style: TgnTxtStyles
                                                            .getTxtStyle(
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
                                            focusNode: _submitbtnFocusNode,
                                            splashColor: TgnColors.bgColor,
                                            onTap: () {
                                              onSubmit(formKey);
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
                    ):  SizedBox(
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
  String token = "";
  String message = "";
  bool auth = false;
  User user;

  Future<String> callSignUpApi() async {
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
      await sharedPreferences.setString(SharedPrefs.TOKEN, token);

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
          MaterialPageRoute(builder: (context) => const BusinessType()),
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
