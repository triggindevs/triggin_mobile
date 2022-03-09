// //
// import 'package:device_info/device_info.dart';
// import 'package:flutter/material.dart';
// import 'package:triggin_app/authorization_screens/signUp.dart';
// import 'dart:io';
//
// import 'device_details.dart';
//
// /// Helper class for device related operations.
// ///
// class DeviceUtils {
//
//   ///
//   /// hides the keyboard if its already open
//   ///
//   static hideKeyboard(BuildContext context) {
//     FocusScope.of(context).unfocus();
//   }
//
//   ///
//   /// accepts a double [scale] and returns scaled sized based on the screen
//   /// orientation
//   ///
//   static double getScaledSize(BuildContext context, double scale) =>
//       scale *
//           (MediaQuery.of(context).orientation == Orientation.portrait
//               ? MediaQuery.of(context).size.width
//               : MediaQuery.of(context).size.height);
//
//   ///
//   /// accepts a double [scale] and returns scaled sized based on the screen
//   /// width
//   ///
//   static double getScaledWidth(BuildContext context, double scale) =>
//       scale * MediaQuery.of(context).size.width;
//
//   ///
//   /// accepts a double [scale] and returns scaled sized based on the screen
//   /// height
//   ///


//   static double getScaledHeight(BuildContext context, double scale) =>
//       scale * MediaQuery.of(context).size.height;
//
//   static Future<DeviceDetails> getDeviceDetails() async {
//     DeviceDetails deviceDetails = DeviceDetails();
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     if(Platform.isAndroid) {
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       deviceDetails.deviceName = androidInfo.model;
//       deviceDetails.identifier = androidInfo.androidId;
//       deviceDetails.deviceVersion = androidInfo.version.release;
//       print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"
//       return deviceDetails;
//     } else if(Platform.isIOS){
//       // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//       // print('Running on ${iosInfo.utsname.machine}');
//       // deviceDetails.deviceName = iosInfo.utsname.machine;
//       // deviceDetails.identifier = iosInfo.identifierForVendor;
//       // deviceDetails.deviceVersion = iosInfo.systemVersion;
//       return deviceDetails;
//     } else {
//       return null;
//     }
//   }
//
// }