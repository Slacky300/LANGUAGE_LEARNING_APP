import 'package:flutter/material.dart';
import 'package:lla/models/language_model.dart';
import 'package:lla/services/language_services.dart';

class LanguageProvider extends ChangeNotifier{

  final LanguageService _languageService = LanguageService();


  List<Language> _languages = [];

  List<Language> get languages => _languages;

  
  Future<void> getLanguagesFromService() async {
    final response = await _languageService.getLanguages();
    _languages = response;
  }

}