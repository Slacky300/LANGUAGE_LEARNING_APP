import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void showSnackBar(BuildContext context, String message, Color color) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  if (scaffoldMessenger.mounted) {
    scaffoldMessenger.showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      backgroundColor: color,
    ));
  }
}


void httpErrorHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  final message = jsonDecode(response.body)['message'];

  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, message, Colors.red);
      break;
    case 401:
      showSnackBar(context, message, Colors.red);
      break;
    case 403:
      showSnackBar(context, message, Colors.red);
      break;
    case 404:
      showSnackBar(context, message, Colors.red);
      break;
    case 500:
      showSnackBar(context, message, Colors.red);
      break;
    default:
      showSnackBar(context, response.body, Colors.red);
  }
}
