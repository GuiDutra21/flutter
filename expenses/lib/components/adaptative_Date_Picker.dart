import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Classe que representa a parte da Data no modal juntamente com o Date Picker
// Adaptável de acordo com o S.O. 
class AdaptativeDatePicker extends StatelessWidget {

  // Atributos
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  // Construtor
  const AdaptativeDatePicker({
    required this.selectedDate,
    required this.onDateChanged,
    super.key
    });

  // função para chamar o elemento(Date picker) que mostra as datas 
  _showDatePicker(BuildContext context)
  {
    showDatePicker( 
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate)
    { 
      if(pickedDate == null)
      {
        return;
      }
      
      onDateChanged(pickedDate);
    });
  }

  // Retorna a árvore de Widgets
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS // Se for no IOS 
        ?   SizedBox(
          height: 180,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumDate: DateTime(2019),
            maximumDate: DateTime.now(),
            onDateTimeChanged: onDateChanged,
          ),
        )

        : SizedBox( // Se não for no IOS
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  // texto que aparece no modal
                  child: Text(
                    // ignore: unnecessary_null_comparison
                    selectedDate == null
                        ? 'Nenhuma Data Selecionada !'
                        : 'Data Selecionada : ${DateFormat('dd/MM/y').format(selectedDate)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // botão de selecionar a data
                TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.purple),
                    onPressed: () => _showDatePicker(context),
                    child: const Text(
                      'Selecionar Data',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          );
  }
}
