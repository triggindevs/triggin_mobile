
class LoginResponse {
  String message;
  bool auth;
  String token;
  User user;

  LoginResponse({this.message, this.auth, this.token, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    auth = json['auth'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['auth'] = this.auth;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  bool emailVerified;
  bool phoneNumberVerified;
  List<IndustryTypes> industryTypes;
  String avatar;
  String role;
  bool active;
  bool isRegistrated;
  String email;
  String phoneNumber;
  String name;
  String id;
  String userId;
  List<Kyc> kyc;
  Null gst;

  User(
      {this.emailVerified,
        this.phoneNumberVerified,
        this.industryTypes,
        this.avatar,
        this.role,
        this.active,
        this.isRegistrated,
        this.email,
        this.phoneNumber,
        this.name,
        this.id,
        this.userId,
        this.kyc,
        this.gst});

  User.fromJson(Map<String, dynamic> json) {
    emailVerified = json['emailVerified'];
    phoneNumberVerified = json['phoneNumberVerified'];
    if (json['industryTypes'] != null) {
      industryTypes = <IndustryTypes>[];
      json['industryTypes'].forEach((v) {
        // industryTypes.add(new IndustryTypes.fromJson(json));
      });
    }
    avatar = json['avatar'];
    role = json['role'];
    active = json['active'];
    isRegistrated = json['isRegistrated'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    id = json['id'];
    userId = json['userId'];
    if (json['kyc'] != null) {
      kyc = <Kyc>[];
      json['kyc'].forEach((v) {
      //  kyc.add(Kyc().fromJson(v));
      });
    }
    gst = json['gst'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailVerified'] = this.emailVerified;
    data['phoneNumberVerified'] = this.phoneNumberVerified;
    if (this.industryTypes != null) {
     // data['industryTypes'] =
   //       this.industryTypes!.map((v) => v.toJson()).toList();
    }
    data['avatar'] = this.avatar;
    data['role'] = this.role;
    data['active'] = this.active;
    data['isRegistrated'] = this.isRegistrated;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['name'] = this.name;
    data['id'] = this.id;
    data['userId'] = this.userId;
    if (this.kyc != null) {
    //  data['kyc'] = this.kyc!.map((v) => Kyc.toJson().toList());
    }
    data['gst'] = this.gst;
    return data;
  }
}

class Kyc {
  Kyc.fromJson(Map<String, dynamic> json);

  static toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  }
}

class IndustryTypes {
  IndustryTypes.fromJson(Map<String, dynamic> json);
}
