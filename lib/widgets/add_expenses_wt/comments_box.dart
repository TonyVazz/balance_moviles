import 'package:flutter/material.dart';

class CommentsBox extends StatelessWidget {
  const CommentsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Icon(
            Icons.sticky_note_2,
            size: 30,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextFormField(
              cursorColor: Colors.green,
              keyboardType: TextInputType.text,
              maxLength: 100,
              decoration: InputDecoration(
                counterText: '',
                hintText: 'Agregar Comentario (Es opcional)',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintStyle: const TextStyle(
                  fontSize: 13,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.green),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
