import 'package:balance/pages/add_expenses.dart';
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
        labelStyle: TextStyle(fontSize: 15),
        onTap:(){
           //Navigator.pushNamed(context, 'addExpenses');
           Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 800),
              transitionsBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child
              ){
                animation = CurvedAnimation(
                  parent: animation, 
                  curve: Curves.easeInOutBack
                  );
                  return ScaleTransition(
                    alignment: const Alignment(0.8, 1),
                    scale: animation,
                    child: child, 
                  );
              },
              pageBuilder:(
                BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
              ){
                return const AddExpenses();
              }
              
              )
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
        labelStyle: TextStyle(fontSize: 15),
        onTap:(){
          //para navegar con una ruta especifica, que colocamos en el main
          Navigator.pushNamed(context, 'addEntries');
        },
      ) 
    );
    return  SpeedDial(
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
      childMargin: EdgeInsets.symmetric(horizontal: 0),
      childrenButtonSize: Size(63, 63),
      icon: Icons.add,
      activeIcon: Icons.close,
      children: botones,  

    );
  }
}