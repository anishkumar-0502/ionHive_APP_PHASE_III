import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ionhive/feature/more/presentation/pages/account/data/urls.dart'; // Urls
import 'package:ionhive/utils/exception/exception.dart'; // Exception thrown Handler

class AccountAPICalls {
  String _getDefaultErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Invalid request. Please check your input.';
      case 401:
        return 'Invalid credentials. Please try again.';
      case 403:
        return 'You do not have permission to access this resource.';
      case 404:
        return 'The requested resource was not found.';
      case 500:
        return 'An error occurred on the server. Please try again later.';
      case 503:
        return 'Service is temporarily unavailable. Please try again later.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseBody;
    }

    throw HttpException(
      response.statusCode,
      responseBody['message'] ?? _getDefaultErrorMessage(response.statusCode),
    );
  }

  Future<Map<String, dynamic>> DeleteAccount(
      String email, String reason, int userId, String authToken) async {
    final url = AccountUrl.DeleteAccount;

    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken', // Add the token here
        },
        body: jsonEncode(
            {'email_id': email, 'reason': reason, 'user_id': userId}),
      )
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(408, 'Request timed out. Please try again.');
      });
      return _handleResponse(response);
    } on http.ClientException {
      throw HttpException(503, 'Please check your internet connection.');
    } catch (e) {
      debugPrint("Error: $e");
      throw HttpException(500, '$e');
    }
  }
}
