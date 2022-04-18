import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import '../core/models/user/user.dart';

class DjangoApi {
  static Future<User?> createUser(String email, String password,
      {String? firstName, String? lastName}) async {
    final response = await post(
      Uri.parse(
          'https://music-app-backend-production.up.railway.app/api=create_user/'),
      body: jsonEncode({
        "username": email,
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName
      }),
    );
    if (response.statusCode >= 400) return null;
    final body = response.body;
    final Map<String, dynamic> result = jsonDecode(body);
    return User.fromJson(result);
  }

  static Future<User?> loginWithEmailAndPassword(
      String email, String password) async {
    final response = await post(
      Uri.parse('https://music-app-backend-production.up.railway.app/api=signin/'),
      body: jsonEncode({
        "username": email,
        "email": email,
        "password": password,
      }),
    );
    if (response.statusCode >= 400) return null;
    final body = response.body;
    final Map<String, dynamic> result = jsonDecode(body);
    return User.fromJson(result);
  }

  static Future<User?> resetPassword(String email, String newPassword) async {
    final response = await post(
      Uri.parse(
          'https://music-app-backend-production.up.railway.app/api=forgot_password/'),
      body: jsonEncode({
        "email": email,
        "new_password": newPassword,
      }),
    );
    if (response.statusCode >= 400) return null;
    final body = response.body;
    final Map<String, dynamic> result = jsonDecode(body);
    return User.fromJson(result);
  }

  static Future<String?> signout() async {
    final response = await get(Uri.parse(
        'https://music-app-backend-production.up.railway.app/api=signout/'));
    if (response.statusCode >= 400) return null;
    return 'Successful';
  }

  static Future<List<Map<String, dynamic>?>?> getFeedbacks(int postId) async {
    final response = await get(Uri.parse(
        'https://music-app-backend-production.up.railway.app/api=feedback/'));
    if (response.statusCode == 401) return null;
    final List<Map<String, dynamic>?>? result =
        json.decode(response.body)['results'];
    return result?.where((element) => element?['id'] == 3).toList();
  }

  static Future<String?> getMusic(String title) async {
    final response = await post(
      Uri.parse(
          'https://music-app-backend-production.up.railway.app/api=music_upload/get/'),
      body: jsonEncode({
        "title": title,
      }),
    );
    if (response.statusCode >= 400) return null;
    final body = response.body;
    return body;
  }

  static Future<String?> getAllMusic() async {
    final response = await get(Uri.parse(
        'https://music-app-backend-production.up.railway.app/api=music_upload/get_all/'));
    if (response.statusCode >= 400) return null;
    return response.body;
  }

  static Future<String?> postFeedback(
      String userId, String issues, String description) async {
    final response = await post(
      Uri.parse('https://music-app-backend-production.up.railway.app/api=feedback/'),
      body: jsonEncode({
        "username": userId,
        "issues": issues,
        "description": description,
      }),
    );
    if (response.statusCode >= 400) return null;
    final body = response.body;
    return body;
  }

  static Future<List?> getNotifications() async {
    final response = await get(Uri.parse(
        'https://music-app-backend-production.up.railway.app/api=notifications/get/'));
    if (response.statusCode == 401) return null;
    final List? result = json.decode(response.body);
    return result;
  }

  static Future<String?> uploadMusic(
      {required String title, required String author, required File pdf}) async {
    final request = MultipartRequest(
      'POST',
      Uri.parse(
          'https://music-app-backend-production.up.railway.app/api=music_upload/'),
    );
    request.files.add(
      await MultipartFile.fromPath(
        'music',
        pdf.path,
      ),
    );

    request.fields['title'] = title;
    request.fields['artist'] = author;

    final response = await request.send();
    if (response.statusCode >= 400) return null;
    return 'Successful';
  }

  static Future<void> requestMusic(
      {required String artist, required String songName}) async {
    await post(
        Uri.parse(
            'https://music-app-backend-production.up.railway.app/api=request_music/'),
        body: jsonEncode({'artist': artist, 'song_name': songName}));
  }

  static Future<List<String>?> getMusics(
    File musicFile,
  ) async {
    final response = await get(
      Uri.parse(
          'https://music-app-backend-production.up.railway.app/api=music_upload/get/'),
    );
    if (response.statusCode >= 400) return null;
    return jsonDecode(response.body);
  }

  static Future<List<String>?> deleteMusic(
    String musicName,
  ) async {
    final response = await delete(
        Uri.parse(
            'https://music-app-backend-production.up.railway.app/api=music_upload/delete/'),
        body: jsonEncode({'file_name': musicName}));

    if (response.statusCode >= 400) return null;
    return jsonDecode(response.body);
  }
}
