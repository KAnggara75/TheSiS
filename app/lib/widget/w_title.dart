import 'package:flutter/material.dart';

import '../constant/size.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(50),
      width: getProportionateScreenWidth(double.infinity),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "   The",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "SiS   ",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: const Color.fromARGB(255, 68, 213, 173),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
