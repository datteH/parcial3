import 'dart:convert';
import 'package:parcial3/json/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.https('reqres.in', 'api/users'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body)['data'];
    List<User> users = [];

    for (var userJson in data) {
      User user = User(
        id: userJson['id'],
        firstName: userJson['first_name'],
        lastName: userJson['last_name'],
        email: userJson['email'],
        avatar: userJson['avatar'],
      );
      users.add(user);
    }

    return users;
  } else {
    throw Exception('Failed to load users');
  }
}
