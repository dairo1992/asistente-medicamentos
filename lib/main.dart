import 'package:asistentemedicamentos/pages/home.dart';
import 'package:asistentemedicamentos/pages/hoy.dart';
import 'package:asistentemedicamentos/pages/progreso.dart';
import 'package:asistentemedicamentos/pages/soporte.dart';
import 'package:asistentemedicamentos/pages/terapia.dart';
import 'package:asistentemedicamentos/providers/home.dart';
import 'package:asistentemedicamentos/providers/service.dart';
import 'package:asistentemedicamentos/providers/serviceProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ChangeNotifierProvider<Services>(create: (_) => Services()),
        ChangeNotifierProvider<ServicesProvider>(
            create: (_) => ServicesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Asistente Medicamentos',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true),
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'hoy': (_) => HoyPage(),
          'progreso': (_) => ProgresoPage(),
          'soporte': (_) => SoportePage(),
          'terapia': (_) => TerapiaPage()
        },
      ),
    );
  }
}
