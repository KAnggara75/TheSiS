import 'package:flutter/material.dart';
import '../../controllers/c_profile.dart';
import '../../widget/w_profile_menu.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  ProfileController createState() => _ProfileBodyState();
}

class _ProfileBodyState extends ProfileController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  isConnect
                      ? CircleAvatar(
                          backgroundColor: Colors.white70,
                          foregroundColor: Colors.black,
                          backgroundImage: NetworkImage(imageUrl),
                        )
                      : const CircularProgressIndicator(),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileMenu(
              text: "My Account",
              icon: Icons.person,
              press: () {
                setting();
              },
            ),
            Notif(
              text: "Notifications ",
              notif: notif ? "Non Active" : "Active",
              color: notif ? const Color(0xFF9B2226) : const Color(0xFF06b3fa),
              icon: notif ? Icons.notifications_off : Icons.notifications,
              press: () {
                switchNotif();
              },
            ),
            ProfileMenu(
              text: "Settings",
              icon: Icons.settings,
              press: () {
                setting();
              },
            ),
            ProfileMenu(
              text: isConnect ? "Help Center | Id : $uid" : "Help Center",
              icon: Icons.help,
              press: () {
                help(uid.toString());
              },
            ),
            ProfileMenu(
              text: "Log Out",
              icon: Icons.exit_to_app,
              press: () {
                signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
