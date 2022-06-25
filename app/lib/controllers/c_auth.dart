import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../constant/url.dart';
import '../constant/size.dart';
import '../constant/text.dart';
import '../service/s_location.dart';
import '../views/auth/v_login.dart';
import '../controllers/c_navbar.dart';
import 'package:flutter/material.dart';
import '../views/auth/v_login_form.dart';
import '../views/auth/v_register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: LoginBody(),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  static String routeName = "/register";

  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: RegisterView(),
    );
  }
}

abstract class LoginController extends State<Login> {
  String msg = '', pmsg = '', emsg = '';
  bool _secureText = true, remember = true, loading = false;
  final List<String> errors = [];
  int status = 0;
  String token = '', name = '', email = '';

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  showHide() {
    setState(() {
      _secureText = !_secureText;
      msg = '';
    });
  }

  forgot() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Coming Soon...."),
      ),
    );
  }

  register() {
    Navigator.pushNamed(
      context,
      RegisterScreen.routeName,
    );
  }

  cek() {
    if (emsg.isNotEmpty) {
      setState(() {
        msg = '$emsg\n';
      });
    } else if (pmsg.isNotEmpty) {
      setState(() {
        msg = '$pmsg\n';
      });
    } else {
      setState(
        () {
          loading = true;
        },
      );
      login();
    }
  }

  Future<void> login() async {
    Map body = {
      "email": user.text,
      "pass": pass.text,
    };

    final response = await http.post(
      API.login,
      body: body,
      headers: API.headers,
      encoding: Encoding.getByName("utf-8"),
    );
    Map<String, dynamic> data = json.decode(response.body);
    if (kDebugMode) {
      print(data);
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      status = data['status'] ?? 0;
      token = data['token'] ?? 0;
      name = data['name'] ?? '';
      email = data['email'] ?? '';
      if (status == 2) {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, UserScreen.routeName);
      } else if (status == 1) {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, AdminScreen.routeName);
      }
      setState(() {
        loading = false;
      });
      savePref(name, email, status, token);
    } else {
      setState(() {
        loading = false;
        msg = data['msg'] ?? "Oops, something went wrong";
      });
      // throw Exception('Failed to login');
    }
  }

  savePref(name, email, status, token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("status", status);
      preferences.setString("name", name);
      preferences.setString("email", email);
      preferences.setString("token", token);
    });
  }

  //Config for Username section
  TextFormField usernameField() {
    return TextFormField(
      controller: user,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          emsg = '';
        } else if (emailValidatorRegExp.hasMatch(value)) {
          emsg = '';
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          emsg = kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          emsg = kInvalidEmailError;
        }
        return;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "E-Mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Icon(
            Icons.mail,
            size: SizeConfig.screenHeight * 0.04,
          ),
        ),
      ),
    );
  }

  //Config for passwordd section
  TextFormField passwordField() {
    return TextFormField(
      controller: pass,
      obscureText: _secureText,
      onChanged: (value) {
        if (value.isNotEmpty) {
          pmsg = '';
        } else if (value.length >= 6) {
          pmsg = '';
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          pmsg = kPassNullError;
        } else if (value.length < 6) {
          pmsg = kShortPassError;
        }
        return;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          iconSize: SizeConfig.screenHeight * 0.04,
          onPressed: showHide,
          icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}

abstract class RegisterController extends State<Register> {
  LocationService locationService = LocationService();

  double lon = 0;
  double lat = 0;

  String msg = '', pmsg = '', emsg = '';
  bool _secureText = true,
      remember = true,
      loading = false,
      locationStatus = false;
  final List<String> errors = [];

  TextEditingController user = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController pass0 = TextEditingController();
  TextEditingController pass1 = TextEditingController();

  @override
  void dispose() {
    locationService.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    locationService.locationStream.listen((userLocation) {
      setState(() {
        lon = userLocation.longitude;
        lat = userLocation.latitude;
        locationStatus = true;
      });
    });
  }

  showHide() {
    setState(() {
      _secureText = !_secureText;
      msg = '';
    });
  }

  cek() {
    if (emsg.isNotEmpty) {
      setState(() {
        msg = '$emsg\n';
      });
    } else if (pmsg.isNotEmpty) {
      setState(() {
        msg = '$pmsg\n';
      });
    } else if (pass0.text != pass1.text) {
      setState(() {
        msg = '$pmsg\n';
      });
    } else {
      if (locationStatus == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Waiting for location"),
          ),
        );
      } else {
        setState(
          () {
            loading = true;
          },
        );
        register();
      }
    }
  }

  Future<void> register() async {
    Map body = {
      "name": fname.text,
      "email": user.text,
      "lon": lon.toString(),
      "lat": lat.toString(),
      "password": pass0.text,
    };

    final response = await http.post(
      API.register,
      body: body,
      headers: API.headers,
      encoding: Encoding.getByName("utf-8"),
    );
    Map<String, dynamic> data = json.decode(response.body);

    int id = data['id'] ?? 0;
    int status = data['status'] ?? 0;
    int mq2Max = data['mq2_max'] ?? 0;
    int tempMax = data['temp_max'] ?? 0;
    int humiMax = data['humi_max'] ?? 0;
    int noWa = data['help_wa'] ?? 6282284705204;
    String name = data['name'] ?? "";
    String email = data['email'] ?? "";
    String password = data['password'] ?? "";
    String pesan = data['messege'] ?? "";
    String mq2Op = data['mq2_op'] ?? "=";
    String humiOp = data['humi_op'] ?? "=";
    String tempOp = data['temp_op'] ?? "=";
    String helpWa = noWa.toString();
    String helpMsg = data['help_msg'] ?? "Fire-App";
    savePref(
      id,
      name,
      email,
      mq2Op,
      status,
      mq2Max,
      humiOp,
      tempOp,
      helpWa,
      helpMsg,
      tempMax,
      humiMax,
      password,
    );
    if (data.isEmpty) {
      setState(() {
        loading = false;
        msg = "Oops, something went wrong";
      });
    } else if (pesan != "Success") {
      setState(
        () {
          loading = false;
          msg = '$pesan\n';
        },
      );
    } else if (pesan == "Success") {
      setState(
        () {
          loading = false;
          msg = '$pesan\n';
        },
      );
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, UserScreen.routeName);
    } else {
      setState(
        () {
          loading = false;
          msg = '$pesan\n';
        },
      );
    }
  }

  savePref(
    id,
    name,
    email,
    mq2Op,
    status,
    mq2Max,
    humiOp,
    tempOp,
    helpWa,
    helpMsg,
    tempMax,
    humiMax,
    password,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("uid", id);
      preferences.setInt("status", status);
      preferences.setInt("mq2Max", mq2Max);
      preferences.setInt("tempMax", tempMax);
      preferences.setInt("humiMax", humiMax);
      preferences.setString("name", name);
      preferences.setString("email", email);
      preferences.setString("mq2Op", mq2Op);
      preferences.setString("tempOp", tempOp);
      preferences.setString("humiOp", humiOp);
      preferences.setString("helpWa", helpWa);
      preferences.setString("helpMsg", helpMsg);
      preferences.setString("password", password);
    });
  }

  //Config for fullname section
  TextFormField fullnameField() {
    return TextFormField(
      controller: fname,
      keyboardType: TextInputType.name,
      onChanged: (value) {
        if (value.isNotEmpty) {
          emsg = '';
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          emsg = kUserNullError;
        }
        return;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Full Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Icon(
            Icons.person,
            size: SizeConfig.screenHeight * 0.04,
          ),
        ),
      ),
    );
  }

  //Config for Username section
  TextFormField usernameField() {
    return TextFormField(
      controller: user,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          emsg = '';
        } else if (emailValidatorRegExp.hasMatch(value)) {
          emsg = '';
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          emsg = kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          emsg = kInvalidEmailError;
        }
        return;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Icon(
            Icons.mail,
            size: SizeConfig.screenHeight * 0.04,
          ),
        ),
      ),
    );
  }

  //Config for passwordd section
  TextFormField passwordField0() {
    return TextFormField(
      controller: pass0,
      obscureText: _secureText,
      onChanged: (value) {
        if (value.isNotEmpty) {
          pmsg = '';
        } else if (value.length >= 6) {
          pmsg = '';
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          pmsg = kPassNullError;
        } else if (value.length < 6) {
          pmsg = kShortPassError;
        }
        return;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          iconSize: SizeConfig.screenHeight * 0.04,
          onPressed: showHide,
          icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }

  //Config for passwordd section
  TextFormField passwordField1() {
    return TextFormField(
      controller: pass1,
      obscureText: _secureText,
      onChanged: (value) {
        if (value.isNotEmpty) {
          pmsg = '';
        } else if (value.length >= 6) {
          pmsg = '';
        }
        return;
      },
      validator: (value) {
        if (value != pass0.text) {
          pmsg = kMatchPassError;
        }
        return;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          iconSize: SizeConfig.screenHeight * 0.04,
          onPressed: showHide,
          icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}
