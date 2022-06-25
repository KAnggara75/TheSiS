import 'package:http/http.dart' as http;

class BaseUrl {
  // static String baseUrl = "http://api.test/";
  static String baseUrl = "https://thesis.kanggara.me/";

  static String login = "${baseUrl}api/login";
  static String register = "${baseUrl}api/register";
  static String board = "${baseUrl}api/board";
  static String user = "${baseUrl}api/user";
  static String image = "https://source.unsplash.com/500x500?men";
}

class API {
  static Future getUsers() {
    return http.get(Uri.parse(BaseUrl.user));
  }

  static Map<String, String>? headers = {
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
  };

  static Future getBoardData($token) {
    return http.get(
      Uri.parse(BaseUrl.board),
      headers: {
        "Authorization": $token,
      },
    );
  }

  static Uri login = Uri.parse(BaseUrl.login);
  static Uri register = Uri.parse(BaseUrl.register);
}

class WA {
  // For help
  static String waUrl = "https://wa.me/";
  static String getHelp(String number, String message) {
    return "$waUrl$number/?text=${Uri.parse(message)}";
  }
}
