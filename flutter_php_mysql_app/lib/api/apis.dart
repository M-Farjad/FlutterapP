import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class Apis {
  static const String _baseUrl =
      'http://192.168.10.10/flutter_php_mysql_backend_api/';
  static const String _fetchUsers = '${_baseUrl}get_users.php';
  static const String _insertUser = '${_baseUrl}insert_user.php';

  static Future<List<UserModel>> fetchUsers() async {
    try {
      log('Fetching users from $_fetchUsers');
      final response = await http.get(Uri.parse(_fetchUsers));
      if (response.statusCode == 200) {
        // Parse the response body and return the list of users
        final List<dynamic> data = json.decode(response.body);
        log('Users fetched successfully: ${data.length} users found');
        return data.map((user) => UserModel.fromJson(user)).toList();
      } else {
        log('Failed to load users: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      log('Error fetching users: $e');
      return [];
    }
  }

  static Future<bool> insertUser(
      String name, String email, String password) async {
    try {
      log('Inserting user: $name, $email, $password');
      final response = await http.post(
        Uri.parse(_insertUser),
        body: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
      final body = json.decode(response.body);
      log('Response from server: ${body['message']}');
      return response.statusCode == 200;
    } catch (e) {
      log('Error adding user: $e');
      return false;
    }
  }
}
