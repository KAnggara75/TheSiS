import 'dart:convert';
import '../constant/url.dart';
import '../models/m_board.dart';

Future<Board> getBoardData(token) async {
  final responseData = await API.getBoardData(token);
  if (responseData.statusCode == 200) {
    return Board.fromJson(jsonDecode(responseData.body));
  } else {
    throw Exception('Failed to load board');
  }
}
