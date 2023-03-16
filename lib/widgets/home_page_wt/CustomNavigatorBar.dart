import 'package:balance/provider/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    
    

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.bnbIndex = i,
      currentIndex: uiProvider.bnbIndex,
      elevation: 0, 
      
      items: const [
      BottomNavigationBarItem(
          label: 'Balance', 
          icon: Icon(Icons.account_balance)),
      BottomNavigationBarItem(
        label: ' Gráficos', 
        icon: Icon(Icons.bar_chart)),
      BottomNavigationBarItem(
          label: ' Configuración', 
          icon: Icon(Icons.settings)),
    ]);
  }
}
