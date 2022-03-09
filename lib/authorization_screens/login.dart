import 'package:flutter/material.dart';
import 'package:triggin_app/authorization_screens/signUp.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;

  final _phoneController = TextEditingController();

  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _loginkey = GlobalKey<FormState>();

  void onSubmit(GlobalKey<FormState> _loginkey) {
    if (_loginkey.currentState.validate()) {
    //  loginApi();
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

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.only(top: 54.0),
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
                      SizedBox(
                        // color: Colors.redAccent,
                        height: constraints.maxHeight * 0.077,
                        child: const ListTile(title: Text(' ')),
                      ),
                      SizedBox(
                        // color: Colors.amber,
                        height: constraints.maxHeight * 0.77,
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
                                      Text('LOGO'),
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
                                                textInputAction:
                                                TextInputAction.next,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField(
                                                controller: _passwordController,
                                                obscureText: _passwordVisible,
                                                decoration: InputDecoration(
                                                  border:
                                                  const OutlineInputBorder(),
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
                                                textInputAction:
                                                TextInputAction.done,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text('Login'),
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
                                                          fontWeight:
                                                          FontWeight.w500,
                                                        ),
                                                        children: [
                                                          const TextSpan(
                                                              text: 'Or ',
                                                              style: TextStyle(
                                                                color: Colors.grey,
                                                              )),
                                                          TextSpan(
                                                            text: 'Create an account'),
                                                        ])),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 0, top: 4),
                                                height: 5.0,
                                                width: 80.0,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            splashColor: Colors.grey,
                                            onTap: () {
                                              onSubmit(_loginkey);
                                            },
                                         //   child: const CirGradBtn(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        //color: Colors.transparent,
                        height: constraints.maxHeight * 0.15,
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
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
