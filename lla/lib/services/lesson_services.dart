import 'dart:convert';

import 'package:lla/models/lessons_model.dart';
import 'package:http/http.dart' as http;
import 'package:lla/utils/constants.dart';
class LessonService {
  Future<List<Lessons>> getLessons(String courseId) async {
    // get lessons from the server
    try {
      // get lessons from the server
      final response = await http
          .get(Uri.parse('${Constansts.baseUrl}/lessons/$courseId'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final lessons = json.map((e) => Lessons.fromJson(e)).toList();
        return lessons;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
