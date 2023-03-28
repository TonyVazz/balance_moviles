import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BSNumKeyboard extends StatefulWidget {
  const BSNumKeyboard({super.key});

  @override
  State<BSNumKeyboard> createState() => _BSNumKeyboardState();
}

class _BSNumKeyboardState extends State<BSNumKeyboard> {
  String importe = '0.00';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _numPad();
      },
      child: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          children: [
            Text('Cantidad Ingresada'),
            Text(
              '\$ $importe',
              style: const TextStyle(
                fontSize: 30,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

_numPad() {
    RegExp regex = RegExp(r'^\d{0,20}(\.\d{0,4})?$'); // Expresión regular

    _num(String _text, double _height) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            if (importe == '0.00') importe = '';
            if (importe.contains(".") && _text == ".") {
              return; // Si ya hay un punto decimal en el importe, no se permite agregar otro
            }
            String newImporte = importe + _text;
            if (regex.hasMatch(newImporte)) {
              importe = newImporte; // Si el nuevo importe coincide con la expresión regular, se permite agregar el dígito
            }
          });
        },
        child: SizedBox(
          height: _height,
          child: Center(
            child: Text(
              _text,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
      );
    }

    showModalBottomSheet(
        barrierColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // isDismissible: false,
        // enableDrag: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 900,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                var _height = constraints.biggest.height / 5;
                return Column(
                  children: [
                    Table(
                      border: TableBorder.symmetric(
                          inside: const BorderSide(
                              // color: Colors.grey,
                              // width: 1.1,
                              )),
                      children: [
                        TableRow(
                          children: [
                            _num('1', _height),
                            _num('2', _height),
                            _num('3', _height),
                          ],
                        ),
                        TableRow(
                          children: [
                            _num('4', _height),
                            _num('5', _height),
                            _num('6', _height),
                          ],
                        ),
                        TableRow(
                          children: [
                            _num('7', _height),
                            _num('8', _height),
                            _num('9', _height),
                          ],
                        ),
                        TableRow(
                          children: [
                            _num('.', _height),
                            ////////
                            _num('0', _height),
                            ////////
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onLongPress: () {
                                setState(() {
                                  importe = '0.00';
                                });
                              },
                              onTap: () {
                                setState(() {
                                  if (importe.isNotEmpty) {
                                    importe = importe.substring(
                                        0, importe.length - 1);
                                  }
                                });
                              },
                              child: SizedBox(
                                height: _height,
                                child: const Icon(
                                  Icons.backspace,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //aqui inician los botones agregados
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: TextButton(
                              onPressed: (() {}),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  'Aceptar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                )),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: TextButton(
                              onPressed: (() {}),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  'Cancelar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ), //aqui terminan los botones agregados
                  ],
                );
              },
            ),
          );
        });
  }
}//fin
