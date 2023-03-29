import 'package:balance/utils/constants.dart';
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
    String Function(Match) mathFunc;
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    mathFunc = (Match match) => '${match[1]},';

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
              '\$ ${importe.replaceAllMapped(reg, mathFunc)}',
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
    if (importe == '0.00') importe = '';

    _num(String _text, double _height) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            if (importe == '0.00') importe = '';
            importe += _text;
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
          return WillPopScope(
            onWillPop: () async => false,
            child: SizedBox(
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
                          Expanded(
                            child: GestureDetector(
                              child: Constants.customButton(
                                  Colors.transparent, Colors.red, 'Cancelar'),
                              onTap: () {
                                setState(() {
                                  importe = '0.00';
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: Constants.customButton(
                                  Colors.transparent, Colors.green, 'Aceptar'),
                              onTap: () {
                                setState(() {
                                  if (importe.isEmpty) importe = '0.00';
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          ),
                        ],
                      ), //aqui terminan los botones agregados
                    ],
                  );
                },
              ),
            ),
          );
        });
  }
}//fin
