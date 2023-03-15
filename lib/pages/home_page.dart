import 'package:balance/pages/balance_page.dart';
import 'package:balance/pages/configuracion_page.dart';
import 'package:balance/pages/graficos_page.dart';
import 'package:balance/widgets/home_page_wt/CustomNavigatorBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomNavigatorBar(),
      body: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const indiceActual = 0;
    switch (indiceActual) {
      case 0:
        return const BalancePage();
      case 1:
        return const GraficosPage();
      case 2:
        return const ConfiguracionPage();
      default:
        return const BalancePage();
    }
  }
}
