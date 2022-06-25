import '../constant/colors.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(
            0xFFF5F6F9,
          ),
          padding: const EdgeInsets.all(
            20,
          ),
          textStyle: const TextStyle(
            fontSize: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
              size: 22,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}

class Notif extends StatelessWidget {
  const Notif({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
    required this.notif,
    required this.color,
    this.size = 18,
  }) : super(key: key);
  final Color color;
  final IconData icon;
  final String text, notif;
  final VoidCallback press;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(
            0xFFF5F6F9,
          ),
          padding: const EdgeInsets.all(
            20,
          ),
          textStyle: TextStyle(
            fontSize: size,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 22,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text + notif,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
