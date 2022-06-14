import 'package:flutter_application_1/app_settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/favoritas_repository.dart';
import 'meuaplicativo.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(create: (context) => FavoritasRepository()),
      ],
      child: MeuAplicativo(),
    ),
  );
}
