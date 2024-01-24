import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int _screenIndex = 0;
  final PageController _pageController = PageController();
  List<Menu> destinations = <Menu>[
    const Menu('Hoy', Icon(Icons.calendar_today_outlined),
        Icon(Icons.today_outlined), 'hoy'),
    const Menu(
        'Progreso', Icon(Icons.bar_chart), Icon(Icons.equalizer), 'progreso'),
    const Menu('Soporte', Icon(Icons.support_agent_sharp),
        Icon(Icons.support_agent_outlined), 'soporte'),
    const Menu('Terapia', Icon(Icons.vaccines_outlined), Icon(Icons.vaccines),
        'terapia'),
  ];

  int get screenIndex => _screenIndex;
  set screenIndex(int index) {
    _screenIndex = index;
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}

class Menu {
  const Menu(this.label, this.icon, this.selectedIcon, this.routing);
  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final String routing;
}
