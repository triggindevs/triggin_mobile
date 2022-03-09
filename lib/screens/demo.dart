// import 'package:flutter/material.dart';
// import 'package:triggin_app/design_files/colors.dart';
// import 'package:triggin_app/design_files/text_styles.dart';
// import 'package:triggin_app/screens/business_type.dart';
// import 'package:triggin_app/widgets/circular_btn.dart';

// import '../UserHomePage.dart';
// import 'sign_up.dart';

// class Demo extends StatefulWidget {
//   const Demo({Key? key}) : super(key: key);

//   @override
//   _DemoState createState() => _DemoState();
// }

// class _DemoState extends State<Demo> {
//   bool _passwordVisible = false;

//   final _phoneController = TextEditingController();

//   final _passwordController = TextEditingController();

//   final GlobalKey<FormState> _loginkey = GlobalKey<FormState>();
//   //Start
//   void gotoHome() async {
//     //SharedPreferences prefs = await SharedPreferences.getInstance();

//     final enteredNumber = _phoneController.text;
//     final enteredPassword = _passwordController.text;
//     String s = "Logged In Successfully";
//     String f = "Phone number or Password does not match.";
//     //prefs.setString('Id', enteredNumber);
//     //prefs.setString('password', enteredPassword);

//     if (enteredNumber == "1234567890" && enteredPassword == "Password@99") {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const BusinessType()),
//       );
//       stausDialog(s);
//     } else if (enteredNumber == "0987654321" &&
//         enteredPassword == "Password@99") {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const UserHomePage()),
//       );
//       stausDialog(s);
//     } else {
//       stausDialog(f);
//     }
//   } //end

//   void onSubmit(GlobalKey<FormState> _loginkey) {
//     if (_loginkey.currentState!.validate()) {
//       gotoHome();
//     }
//   }

//   Future<void> stausDialog(String g) async {
//     await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Status'),
//             content: Text(g),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text('Ok'),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           );
//         });
//   }

//   @override
//   void dispose() {
//     _phoneFocusNode.dispose();
//     _passwordFocusNode.dispose();
//     super.dispose();
//   }

//   final _passwordFocusNode = FocusNode();
//   final _phoneFocusNode = FocusNode();

//   @override
//   // ignore: must_call_super
//   void initState() {
//     _passwordVisible = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final tHeight = MediaQuery.of(context).size.height;
//     // final tWidth = MediaQuery.of(context).size.width;
//     // final double cardPadding = tHeight * 0.15;
//     //  final double cardHeight = tHeight * 0.69;
  
//     return Scaffold(
//       backgroundColor: TgnColors.bgColor,
//       body: Padding(
//         padding:  const EdgeInsets.only(top:54.0),
//         child: LayoutBuilder(
//             builder: (BuildContext context, BoxConstraints constraints) {
//           // constraints variable has the size info
//           return Stack(
//             children: [
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Image.asset('assets/bg_assets/Rectangle.jpg'),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     // color: Colors.redAccent,
//                     height: constraints.maxHeight * 0.077,
//                     child: const ListTile(title: Text(' ')),
//                   ),
//                   Container(
//                     // color: Colors.amber,
//                     height: constraints.maxHeight * 0.77,
//                     width: double.infinity,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: constraints.maxHeight * 0.027),
//                       child: Card(
//                         margin: EdgeInsets.zero,
//                         borderOnForeground: true,
//                         elevation: 2,
//                         child: Stack(
//                           children: [
//                             Positioned(
//                                 top: 0,
//                                 left: 0,
//                                 child: Image.asset('assets/bg_assets/Semi.jpg')),
//                             Padding(
//                               padding: const EdgeInsets.all(20.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('LOGO',
//                                       style:
//                                           TgnTxtStyles.getTxtStyle(fontSize: 36)),
//                                   Expanded(
//                                     child: Container(
//                                      // color: Colors.amberAccent,
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         //crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//                                           TextFormField(
//                                             maxLength: 10,
//                                             controller: _phoneController,
//                                             decoration: const InputDecoration(
//                                                 border: OutlineInputBorder(),
//                                                 hintText: "91 8089843934"),
//                                             //autofocus: true,
//                                             validator: (value) {
//                                               if (value!.isEmpty) {
//                                                 return 'Phone Number is Required';
//                                               } else {
//                                                 return null;
//                                               }
//                                             },
//                                             focusNode: _phoneFocusNode,
//                                             keyboardType: TextInputType.phone,
//                                             textInputAction: TextInputAction.next,
//                                           ),
//                                           TextFormField(
//                                             controller: _passwordController,
//                                             obscureText: !_passwordVisible,
//                                             decoration: InputDecoration(
//                                               border: const OutlineInputBorder(),
//                                               hintText: "Password",
//                                               suffixIcon: Padding(
//                                                 padding:
//                                                     const EdgeInsets.fromLTRB(
//                                                         0, 0, 5, 0),
//                                                 child: IconButton(
//                                                   icon: Icon(
//                                                     // Based on passwordVisible state choose the icon
//                                                     _passwordVisible
//                                                         ? Icons.visibility_off
//                                                         : Icons.visibility,
//                                                   ),
//                                                   onPressed: () {
//                                                     // Update the state i.e. toogle the state of passwordVisible variable
//                                                     setState(() {
//                                                       _passwordVisible =
//                                                           !_passwordVisible;
//                                                     });
//                                                   },
//                                                 ),
//                                               ),
//                                             ),
//                                             focusNode: _passwordFocusNode,
//                                             validator: (value) {
//                                               if (value!.isEmpty) {
//                                                 return 'Password is Required';
//                                               } else {
//                                                 return null;
//                                               }
//                                             },
//                                             keyboardType: TextInputType.text,
//                                             textInputAction: TextInputAction.done,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text('Login',
//                                               style: TgnTxtStyles.getTxtStyle(
//                                                   fontSize: 24)),
//                                           InkWell(
//                                             onTap: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           const SignUp()));
//                                             },
//                                             child: RichText(
//                                                 text: TextSpan(
//                                                     style: const TextStyle(
//                                                       fontSize: 22,
//                                                       fontWeight: FontWeight.w500,
//                                                     ),
//                                                     children: [
//                                                   const TextSpan(
//                                                       text: 'Or ',
//                                                       style: TextStyle(
//                                                         color: TgnColors
//                                                             .secondaryText,
//                                                       )),
//                                                   TextSpan(
//                                                     text: 'Create an account',
//                                                     style:
//                                                         TgnTxtStyles.getTxtStyle(
//                                                             fontSize: 16),
//                                                   ),
//                                                 ])),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.only(
//                                                 bottom: 0, top: 4),
//                                             height: 5.0,
//                                             width: 80.0,
//                                             color: TgnColors.primaryText,
//                                           ),
//                                         ],
//                                       ),
//                                       InkWell(
//                                         splashColor: TgnColors.bgColor,
//                                         onTap: () {
//                                           onSubmit(_loginkey);
//                                         },
//                                         child: const CirGradBtn(),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     color: Colors.transparent,
//                     height: constraints.maxHeight * 0.15,
//                   ),
//                 ],
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }
