import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class InternetChecker {
  final _domain = 'google.com';

  Future<bool> hasInternet() async {
    try {
      if (kIsWeb) {
        final response = await http.get(
          Uri.parse(_domain),
        );
        return response.statusCode == 200;
      } else {
        final result = await InternetAddress.lookup(_domain);
        return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
      }
    } catch (_) {
      return false;
    }
  }
}
