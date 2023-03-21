import 'package:flutter/material.dart';

class AddExpenses extends StatelessWidget {
  const AddExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Agrega Gastos'),
      ),
      body: Center(
        
        child: Text('Desde Gastos')
      )
    );
  }
}