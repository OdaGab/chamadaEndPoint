import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart'; // ← Importa chamaEndPoint!

// A função abaixo permite que um endpoint seja executado. Para tanto,
// é preciso garantir que os parâmetros de entrada sejam fornecidos, tais como
// nome, email, etc, com os tipos corretos dos dados.
//
// Os dados e seus tipos definidos no parâmetro da função devem ser
// especificados no menu lateral à direita, na área "Define Arguments".
//
// Importante: O nome da função deve ser igual ao nome do Custom Action.
// Neste exemplo, o nome do Custom Action é novoUsuario.
Future<bool> novoUsuario(
  String nome,
  String email,
  String password,
) async {
  final url = 'https://x8ki-letl-twmt.n7.xano.io/api:UekUIwne/auth/signup';

  // 🧩 Monta o body do JSON
  final body = {"name": nome, "email": email, "password": password};

  // ✅ CHAMA O CUSTOM ACTION GENÉRICO!
  bool sucesso = await chamaEndPoint(url, 'POST', body);

  return sucesso;

}
