

import 'package:flutter/material.dart';

class AddEntries extends StatelessWidget {
  const AddEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agrega tus ingresos'),
      ),
      body: Center(
        child: Text('Desde Ingresos')
      )
    );
  }
}