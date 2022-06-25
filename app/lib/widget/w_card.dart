import 'package:flutter/material.dart';
import '../constant/size.dart';

class CardMini extends StatelessWidget {
  const CardMini({
    Key? key,
    this.title = "",
    this.content = "",
    this.subtitle = "",
    this.isLoaded = true,
    this.color = Colors.white,
    this.titleColor = Colors.black,
  }) : super(key: key);
  final String title, content, subtitle;
  final Color color, titleColor;
  final bool isLoaded;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(200),
      width: getProportionateScreenWidth(100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: isLoaded
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (subtitle.length > 8) ? 14 : 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
