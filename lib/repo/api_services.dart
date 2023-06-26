import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:r_r_admin/repo/api_status.dart';

class ApiServies {
  static Future<Object> postmethod(
    String url,
    Map data,
    context,
    Function function,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
      );

      log("-------------${response.statusCode}-----------------");
      if (response.statusCode == 201 || response.statusCode == 200) {
        log(response.body.toString());
        return Success(response: function(response.body));
      }
      return Failures(
          code: response.statusCode, errrorResponse: "Invalid Response");
    } on HttpException {
      return Failures(code: 101, errrorResponse: "No Internet");
    } on FormatException {
      return Failures(code: 102, errrorResponse: "Invalid Format");
    } on SocketException catch (e) {
      log(e.toString());
      return Failures(code: 101, errrorResponse: "No Internet");
    } on TimeoutException {
      return Failures(code: 104, errrorResponse: "Time Out");
    } catch (e) {
      log(e.toString());
      return Failures(code: 500, errrorResponse: "Unknown error");
    }
  }

  static Future<Object> getMethod(
      String url, Map<String, String>? headers, Function function) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      log("----------------${response.statusCode}----------------------");
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("Success");
        return Success(response: function(response.body));
      }
      return Failures(
          code: response.statusCode, errrorResponse: "Invalid Response");
    } on HttpException {
      return Failures(code: 101, errrorResponse: "No Internet");
    } on FormatException {
      return Failures(code: 102, errrorResponse: "Invalid Format");
    } on SocketException catch (e) {
      log(e.toString());
      return Failures(code: 101, errrorResponse: "No Internet");
    } on TimeoutException {
      return Failures(code: 104, errrorResponse: "Time Out");
    } catch (e) {
      log(e.toString());
      return Failures(code: 500, errrorResponse: "Unknown error");
    }
  }

  static Future<Object> postCarmethod(
    String url,
    Map data,
    context,
    Map<String, String>? headers,
  ) async {
    try {
      log("11111111111111");
      final response =
          await http.post(Uri.parse(url), body: data, headers: headers);
      log("222222222222222");
      log(response.body.toString());
      log("-------------${response.statusCode}-----------------");
      if (response.statusCode == 201 || response.statusCode == 200) {
        log(response.body.toString());
        return Success(response: response.body);
      }
      return Failures(
          code: response.statusCode, errrorResponse: "Invalid Response");
    } on HttpException {
      return Failures(code: 101, errrorResponse: "No Internet");
    } on FormatException {
      return Failures(code: 102, errrorResponse: "Invalid Format");
    } on SocketException catch (e) {
      log(e.toString());
      return Failures(code: 101, errrorResponse: "No Internet");
    } on TimeoutException {
      return Failures(code: 104, errrorResponse: "Time Out");
    } catch (e) {
      log(e.toString());
      return Failures(code: 500, errrorResponse: "Unknown error");
    }
  }
}
