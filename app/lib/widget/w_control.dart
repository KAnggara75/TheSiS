import 'package:flutter/material.dart';
import '../constant/size.dart';

class ControlWidget extends StatelessWidget {
  const ControlWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffcaffbf),
            ),
            height: getProportionateScreenHeight(200),
            // width: MediaQuery.of(context).size.width * 0.8,
          ),
        ],
      ),
    );
  }
}
