import 'package:balance/utils/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/add_expenses_wt/bs_num_keyboard.dart';
import '../widgets/add_expenses_wt/comments_box.dart';

class AddExpenses extends StatelessWidget {
  const AddExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //para quitar el teclado, guardar este peque;o bloque
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      }, // aqui termina
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Agrega Gastos'),
            elevation: 0,
          ),
          body: Column(
            children: [
              BSNumKeyboard(),
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: Constants.sheetBoxDecoration(
                        Theme.of(context).primaryColorDark),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Fecha 22 marzo de 2023'),
                        Text('Seleccionar Categoria'),
                        CommentsBox(),
                        Expanded(child: Center(child: Text('Boton'))),
                      ],
                    )),
              )
            ],
          )),
    );
  }
}
