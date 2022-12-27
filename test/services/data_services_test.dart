import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test(
    "Check if API Working",
    (() async {
      // Arrange
      String baseUrl = "http://mark.bslmeiyu.com/api";
      var apiUrl = "/getplaces";

      // Act
      http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));

      // Assert
      expect(res.statusCode, 200);
      if (kDebugMode) {
        // print(res.body );
      }
    }),
  );
}
