// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> chamaEndPoint(
  String? url,
  String metodo,
  dynamic body,
) async {
  if (url == null || url.isEmpty) {
    FFAppState().update(() {
      FFAppState().respEndPointError = 'URL não fornecida';
    });
    return false;
  }

  try {
    final uri = Uri.parse(url);
    final bodyString = body != null && ['POST', 'PUT', 'PATCH'].contains(metodo)
        ? jsonEncode(body)
        : null;

    http.Response response;
    switch (metodo.toUpperCase()) {
      case 'GET':
        response = await http.get(uri);
        break;
      case 'POST':
        response = await http.post(uri,
            headers: {"Content-Type": "application/json"}, body: bodyString);
        break;
      case 'PUT':
        response = await http.put(uri,
            headers: {"Content-Type": "application/json"}, body: bodyString);
        break;
      case 'PATCH':
        response = await http.patch(uri,
            headers: {"Content-Type": "application/json"}, body: bodyString);
        break;
      case 'DELETE':
        response = await http.delete(uri);
        break;
      default:
        FFAppState().update(() {
          FFAppState().respEndPointError = 'Método HTTP não suportado: $metodo';
        });
        return false;
    }

    dynamic data;
    try {
      data = jsonDecode(response.body);
    } catch (e) {
      data = response.body;
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      FFAppState().update(() {
        FFAppState().respEndPoint = data;
      });
      return true;
    } else {
      FFAppState().update(() {
        FFAppState().respEndPointError =
            (data is Map && data['message'] != null)
                ? data['message'].toString()
                : 'Erro HTTP: ${response.statusCode}';
      });
      return false;
    }
  } catch (e) {
    FFAppState().update(() {
      FFAppState().respEndPointError = 'Erro de conexão: $e';
    });
    return false;
  }
}