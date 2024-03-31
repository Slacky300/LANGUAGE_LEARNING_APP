import 'package:flutter/material.dart';
import 'package:lla/models/lessons_model.dart';
import 'package:lla/services/lesson_services.dart';

class LessonProvider with ChangeNotifier {

  final LessonService _lessonService = LessonService();

  List<Lessons> _lessons = [];

  List<Lessons> get lessons {
    return [..._lessons];
  }

  Future<void> getLessonsFromService(String courseId) async {
    final response = await _lessonService.getLessons(courseId);
    _lessons = response;
    notifyListeners();
  }
}