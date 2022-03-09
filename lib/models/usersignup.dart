class UserSignUp {
  String name;
  String password;
  String phoneNumber;
  String email;

  UserSignUp(
      {this.name,
        this.password,
        this.phoneNumber,
        this.email
      });

  UserSignUp.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    return data;
  }
}