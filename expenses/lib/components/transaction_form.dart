import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_textField.dart';
import 'adaptative_Date_Picker.dart';

// Clsse que representa o conteúdo do Modal
class TransactionForm extends StatefulWidget {

  // Atributo
  final void Function(String, double, DateTime) onSubmit;

  // Construtor
  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {

  // Classes que permitem o controle da entrada de dados
  final _titleController = TextEditingController(); 
  final _valueController = TextEditingController();

  // Por padrão a data selecionada é a de hoje
  DateTime _selectedDate = DateTime.now();

  // Função que envia os dados do modal para criar uma Transaction
   _submitForm() {
    final title = _titleController.text;
    
    // função split remove os espaços e convere a variável em lista, mas o join trasnformar de volta em String
    final value = double.tryParse(_valueController.text.split(" ").join()) ?? 0.0;

    // se o título ou o valor forem vazios não cadastra uma nova transação
    if (title.isEmpty || value <= 0 ) 
    {
      return;
    }
    // componente que permite a passagem correta dos dados para o widget precedente, atualizando caso necessário
    widget.onSubmit(title, value, _selectedDate);
  }

  // Retorna a árvore de Widgets
  @override
  Widget build(BuildContext context) {
    return Card(
        // Campo onde entramos com os dados da transação
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[

              // Campo onde entramos com os nomes/Tíitulos da transação
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) =>_submitForm(),
                label: 'Título',
                ),

              // Campo onde entramos com o valor da transação
              AdaptativeTextField(
                controller: _valueController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                label: ' Valor (R\$)' ,
                onSubmitted: (_) => _submitForm(),
                ),

              // Chama o Date Picker de acordo com cada S.O.
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate)
                {
                  setState(() {
                    _selectedDate = newDate;
                  });
                }
               ),

              //Botão de 'Nova Transação'
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(label: 'Nova Transação', onPressed: _submitForm)
                ],
              ),
            ],
          ),
        ),
      );
  }
}