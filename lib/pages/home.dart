import 'package:asistentemedicamentos/pages/hoy.dart';
import 'package:asistentemedicamentos/pages/progreso.dart';
import 'package:asistentemedicamentos/pages/soporte.dart';
import 'package:asistentemedicamentos/pages/terapia.dart';
import 'package:asistentemedicamentos/providers/home.dart';
import 'package:asistentemedicamentos/widgets/navigatorBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => HomeProvider(),
        child: const Scaffold(
            body: _Page(), bottomNavigationBar: NavigatorMenu()));
  }
}

class _Page extends StatelessWidget {
  const _Page({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<HomeProvider>(context);
    return PageView(
      controller: navegacionModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [HoyPage(), ProgresoPage(), SoportePage(), TerapiaPage()],
    );
  }
}
