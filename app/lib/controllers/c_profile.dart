import './c_auth.dart';
import '../constant/url.dart';
import 'package:flutter/material.dart';
import '../views/profile/v_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileController extends State<ProfileBody> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isConnect = false;
  late String email, imageUrl;
  String name = "Loading...";
  int uid = 1;
  bool notif = true;

  @override
  void initState() {
    super.initState();
    getPref();
  }

  help(String uid) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("help not yet available"),
      ),
    );
  }

  webNotification() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Notif not yet available for web"),
      ),
    );
  }

  switchNotif() {
    setState(() {
      notif = !notif;
    });
  }

  getPref() async {
    SharedPreferences pref = await _prefs;
    setState(() {
      isConnect = true;
      imageUrl = BaseUrl.image;
      name = pref.getString("name").toString();
      email = pref.getString("email").toString();
    });
  }

  setting() {
    // Navigator.pushNamed(context, SettingScreen.routeName);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Setting not yet available"),
      ),
    );
  }

  signOut() async {
    SharedPreferences pref = await _prefs;
    await pref.clear();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }
}
