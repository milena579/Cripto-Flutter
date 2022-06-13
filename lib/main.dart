import 'dart:js';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/favoritas_page.dart';
import 'package:flutter_application_1/favoritas_repository.dart';
import 'meuaplicativo.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritasRepository(),
      child: MeuAplicativo(),
    ),
  );
}


