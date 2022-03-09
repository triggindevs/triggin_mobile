
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triggin_app/models/usersignup.dart';

class APIs {
  static String contentTypeAppJson = "Content-Type" + ':' + "application/json";

//BASE URL
  static String baseURL_UAT = "http://backend.triggin.com/api/v1/";

  static String baseURL = baseURL_UAT;

  static String signIn = baseURL + "auth/login";
  static String signUp = baseURL + "auth/signup";

}


class SharedPrefs {

  static String FACILITYID = "FACILITYID";
  static String CURRENTUSERROLE = "CURRENTUSERROLE";
  static String ORGANIZATIONNAME = 'ORGANIZATIONNAME';
  static String FACILITYNAME = "FACILITYNAME";
  static String DISCIPLINEANAME = "DISCIPLINEANAME";
  static String FIRSTNAME = "FIRSTNAME";
  static String NAME = "LASTNAME";
  static String PHONENUMBER = "PHONENUMBER";
  static String EMAIL = "EMAIL";
  static String USERNAME = "USERNAME";
  static String ID = "ID";
  static String UNITID = "UNITID";
  static String DISCIPLINEID = "DISCIPLINEID";
  static String TOKEN = "TOKEN";
  static String isGotNewNotification  = 'isGotNewNotification';
  static String ISONBOARDING = 'try one';
  static String ISFIRST = 'try one';
  static String TEMPFLOW ='try one';
  static String TEMP = 'try one';
  static bool showNotificationDot = false;
  static String isMessageSent = 'isMessageSent';
  static String userRole = 'userRole';
  static String shiftType = 'shiftType';
  static String shiftDuration = 'shiftDuration';




  static void saveSharedPreferences(UserSignUp _userdetails) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(NAME, _userdetails.name);
    await sharedPreferences.setString(PHONENUMBER, _userdetails.phoneNumber);
    await sharedPreferences.setString(EMAIL, _userdetails.email);
    // await sharedPreferences.setInt(ID, _userdetails.user.id);
  }

  // static Future<DemoUser> readSharedPreferences() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var firstname = sharedPreferences.getString(FIRSTNAME);
  //   var lastname = sharedPreferences.getString(LASTNAME);
  //   var token = sharedPreferences.getString(TOKEN);
  //   var username = sharedPreferences.getString(USERNAME);
  //   var userId = sharedPreferences.getInt(ID);
  //   DemoUser demoUser = new DemoUser(firstname, lastname, token, username, userId);
  //   return demoUser;
  // }

  static Future saveSelectedFacilityId(int id, String facilityName) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(FACILITYID, id);
    sharedPreferences.setString(FACILITYNAME, facilityName);

  }

  static Future saveNewNotification(bool isGotNotification) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(isGotNewNotification, isGotNotification);
  }

  static Future<bool> readNewNotification() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool res = sharedPreferences.getBool(isGotNewNotification);
    if(res!=null){
      return res;
    }
    return false;
  }
  static void saveisonboarding(bool onboarding) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool("ISONBOARDING", onboarding);
  }

  static Future<bool> readisonboarding() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool res = sharedPreferences.getBool("ISONBOARDING");
    if(res!=null){
      if(res == true){
        return true;
      }else{
        return false;
      }
    }
    return false;
  }
  static void saveisfirst(bool isfirst) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool("ISFIRST", isfirst);
  }

  static Future<bool> readisfirst() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool res = sharedPreferences.getBool("ISFIRST");
    if(res!=null){
      if(res == true){
        return true;
      }else{
        return false;
      }
    }
    return false;
  }
  static void savetemp(int tempflow) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt("TEMPFLOW", tempflow);
  }

  static Future<int> readtemp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int res = sharedPreferences.getInt("TEMPFLOW");
    print(res);
    if(res!=null){
      if(res ==0)
      {
        return 0;
      }
      if(res ==1){
        return 1;
      }else if(res==2)
      {
        return 2;
      }
    }
    return 0;
  }
  static void saveisthroughtemppwd(bool temp) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool("TEMP", temp);
  }

  static Future<bool> readisthroughtemppwd() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool res = sharedPreferences.getBool("TEMP");
    if(res!=null){
      if(res == true){
        return true;
      }else{
        return false;
      }
    }
    return true;
  }

  static Future<void> clearSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(NAME);
    sharedPreferences.remove(TOKEN);
    sharedPreferences.remove(USERNAME);
    await sharedPreferences.clear();
  }
}
