import 'package:flutter/material.dart';
import 'package:thesis/constant/size.dart';
import 'package:thesis/controllers/c_board.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends BoardController {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: getProportionateScreenWidth(235),
          height: getProportionateScreenHeight(500),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Alarm",
                  ),
                  const Text(
                    " | ",
                  ),
                  Container(
                    color: Colors.red,
                    width: getProportionateScreenWidth(50),
                    height: getProportionateScreenHeight(20),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Alarm",
                  ),
                  const Text(
                    " | ",
                  ),
                  Container(
                    color: Colors.green,
                    width: getProportionateScreenWidth(50),
                    height: getProportionateScreenHeight(20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Alarm",
                  ),
                  const Text(
                    " | ",
                  ),
                  Container(
                    color: Colors.blue,
                    width: getProportionateScreenWidth(50),
                    height: getProportionateScreenHeight(20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Alarm",
                  ),
                  const Text(
                    " | ",
                  ),
                  Container(
                    color: Colors.black,
                    width: getProportionateScreenWidth(50),
                    height: getProportionateScreenHeight(20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
