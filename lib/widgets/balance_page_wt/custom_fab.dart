import 'package:balance/pages/add_entries.dart';
import 'package:balance/pages/add_expenses.dart';
import 'package:balance/widgets/custom/custom_animacion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key});
  

  @override
  Widget build(BuildContext context) {
    List<SpeedDialChild> botones = [];
    

    //*Boton para agregar gastos
    botones.add(
      SpeedDialChild(
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.remove),
        label: 'gasto',
        labelStyle: const TextStyle(fontSize: 15),
        onTap:(){
          //para navegar con animacion
           Navigator.push(
            context,
            CustomAnimacion(page: const AddExpenses(), duracion: const Duration(milliseconds: 800), acomodo: const Alignment(0.8, 1))
            );

        },
      ) 
    );

    //boton para agregar ingresos
    botones.add(
      SpeedDialChild(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        label: 'ingreso',
        labelStyle: const TextStyle(fontSize: 15),
        onTap:(){
          //para navegar con una ruta especifica, que colocamos en el main
          // Navigator.pushNamed(context, 'addEntries');
          Navigator.push(
            context,
            CustomAnimacion(page: const AddEntries(), duracion: const Duration(milliseconds: 800), acomodo: const Alignment(0.8, 1))
            );
        },
      ) 
    );
      return  SpeedDial(
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        childMargin: const EdgeInsets.symmetric(horizontal: 0),
        childrenButtonSize: const Size(63, 63),
        icon: Icons.add,
        activeIcon: Icons.close,
        children: botones,  

    );
  }
}