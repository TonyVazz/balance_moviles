import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(elevation: 0, items: [
      BottomNavigationBarItem(
          label: 'Balance', icon: Icon(Icons.account_balance)),
      BottomNavigationBarItem(label: ' Gráficos', icon: Icon(Icons.bar_chart)),
      BottomNavigationBarItem(
          label: ' Configuración', icon: Icon(Icons.settings)),
    ]);
  }
}
