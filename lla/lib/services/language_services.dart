import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lla/models/language_model.dart';
import 'package:lla/utils/constants.dart';


class LanguageService {
   Future<List<Language>> getLanguages() async {
    try {
      http.Response response = await http.get(
        Uri.parse('${Constansts.baseUrl}/languages')
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final languages = json.map((e) {
          return Language(
            id: e['_id'],
            name: e['name'],
            code: e['code'],
            description: e['description'],
            image: e['image']
          );
        }).toList();
        return languages;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
