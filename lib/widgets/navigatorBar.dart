import 'package:asistentemedicamentos/providers/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigatorMenu extends StatelessWidget {
  const NavigatorMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeService = Provider.of<HomeProvider>(context);
    return NavigationBar(
      destinations: homeService.destinations.map(
        (Menu destination) {
          return NavigationDestination(
            label: destination.label,
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
            tooltip: destination.label,
          );
        },
      ).toList(),
      selectedIndex: homeService.screenIndex,
      onDestinationSelected: (value) {
        homeService.screenIndex = value;
        // Navigator.pushReplacementNamed(
        //     context, homeService.destinations[value].routing);
      },
    );
  }
}
