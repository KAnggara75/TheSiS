import 'package:flutter/material.dart';

import '../views/board/v_board.dart';

class BoardScreen extends StatelessWidget {
  static String routeName = '/board';
  const BoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

abstract class BoardController extends State<BoardPage> {}
