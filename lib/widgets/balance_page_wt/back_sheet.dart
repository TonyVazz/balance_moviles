import 'package:flutter/material.dart';

class BackSheet extends StatelessWidget {
  const BackSheet({super.key});

  @override
  Widget build(BuildContext context) {
    _cabeceras(String nombre, String cantidad) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 13, bottom: 5),
            child: Text(
              nombre,
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 1.5,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          Text(
            cantidad,
            style: TextStyle(
                fontSize: 20,
                letterSpacing: 1.5,
                color: Theme.of(context).cardColor),
          )
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _cabeceras('Ingresos', '\$ 1,500.00'),
        const VerticalDivider(
          thickness: 2,
        ),
        _cabeceras('Gastos', '\$ 1,499.00'),
      ],
    );
  }
}
