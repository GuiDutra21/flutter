import 'dart:math';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/transaction_list.dart';
import 'components/transaction_form.dart';
import 'components/chart.dart';
import './models/transaction.dart';

//flutter run --no-enable-impeller
main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    final ThemeData tema = ThemeData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,// Retira aquela fitinha vermelha escrita DEMO   
      home: const MyHomePage(),

      // tema do aplicativo no geral
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
        primary: Colors.purple,
        secondary: Colors.amber,
        ),
    
        // tema dos textos
        textTheme: tema.textTheme.copyWith(
            titleMedium: const TextStyle( // para textos 'medios'
              fontFamily: 'EBGaramond',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            labelSmall: const TextStyle( // para textos 'pequenos'
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),

        // tema do AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          titleTextStyle: TextStyle(
            fontFamily: 'EBGaramond',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = []; // lista de transações
  bool _showChart = false; // Varíavel usada para mostrar ou não o gráfico quando o célular está no modo deitado

  List<Transaction> get _recentTransactions // getter das listas recentes
  {
    // faz o filtro das Transactions dos últimos 7 dias, obs : pode haver mais de um Transaction no dia
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days:7), // Somente retorna a Transaction caso seja verdadeiro
      ));
    }).toList();
  }

  // função que adiciona as transactions
  _addTransaction(String title, double value, DateTime date)
  {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction); // Permite a atualização das informações
    });

    Navigator.of(context).pop(); // Fecha o Modal após criamos uma nova transação
  }

  _removeTransaction(String id)
  {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  void _openTransactionFormModal(BuildContext context) // as duas funções que fazem o modal aparecer
  {
     showModalBottomSheet(
      // Variável que permite que o modal suba a quantidade necessária para não ficar atrás do teclado
      isScrollControlled: true,
      context: context,
      isDismissible: true, // Define se o painel modal pode ser descartado tocando fora dele
      builder: (BuildContext context) {
        return SingleChildScrollView( // Faz com que o modal seja rolavel
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TransactionForm(_addTransaction),
          ),
        );
      },
    );
  }

  // Função que vai gerar os ícones do appBar para cada S.O.
  Widget _getIconButton(IconData icon, Function() fn)
  {
    return Platform.isIOS ?
      GestureDetector(onTap: fn, child: Icon(icon)) // Ícone no IOS
      : 
      IconButton(icon: Icon(icon), onPressed: fn, color: Colors.white,); // Ícone no Android
  }

  // Retorna a árvore de Widgets
  @override
  Widget build(BuildContext context)
  {
    // variável que atribui o MediaQuery para no decorrer
    // do códgido não precisar ficar criando o MediaQuery varias vezes
    final mediaQuery = MediaQuery.of(context);

    // variável para detectar a rotação do celular, se está deitado ou não
    bool isLandScape = mediaQuery.orientation ==  Orientation.landscape;

    // Variável que representa os ícones da lista e do gráfico para cada S.O.
    final iconList = Platform.isIOS ? CupertinoIcons.list_bullet : Icons.format_list_bulleted;
    final iconChart = Platform.isIOS ? CupertinoIcons.chart_bar_alt_fill : Icons.bar_chart_outlined;

    // Lista de Widgets que vai carregar os ícones que vão vir no AppBar
    final List<Widget> actions = <Widget>[
        if(isLandScape) // ícones quando o celular está deitado
          _getIconButton(
          _showChart ? iconList : iconChart,
            ()
            {
              setState(()
              {
                _showChart = !_showChart;
              });
            }, 
          ),
        _getIconButton( // ícones quando o celular está em pé
          Platform.isIOS ? CupertinoIcons.add : Icons.add, // Adaptação do tipo do ícone para o tipo do S.O.
           () => _openTransactionFormModal(context), // Quando clica no ícone abre o modal
        )
      ];

    // todo AppBar precisa ser do tipo PreferredSizedWidget
    final PreferredSizeWidget appBar = AppBar( // somente para o Android
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          // elemento que permite a mudança do tamanho da 
          // fonte quando o usuário alterar o tamhanho dos textos nas configurações do celular
          fontSize: 13 * mediaQuery.devicePixelRatio,
          ),
        ),
      // centraliza o texto do AppBar
      centerTitle: true, 
      // Essas actions que permite que coloquemos mais elementos no AppBar
      actions: actions 
    );

    // tamanho do dispositivo subtraindo o tamanho do AppBar e da barra de notificação
    final availableheight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    // Variável que representa tudo o que virá abaixo do AppBar
    final bodyPage = SafeArea( // Esse Widget permite que o body fique no seu devido lugar, sem ultrapassar o note
      child: SingleChildScrollView(
          // Habilia o Scroll somente nesse widget
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if(isLandScape)
                const SizedBox( // sizedbox vazio apenas para dar um espaço
                  height: 20,
                ),

              if(_showChart || !isLandScape) // lógica para mostra só o gráfico 
              SizedBox(
                // 65% do tamanho para o Gráfico quando a tela está deitada e 25% quando está em pé
                height: availableheight * (isLandScape ? 0.65 : 0.25),
                // chama o gráfico passando as Transaction recentes
                child: Chart(_recentTransactions),
              ),

              if(!_showChart || !isLandScape)// Lógica para mostrar só a imagem ou as Transactions
              SizedBox(
                // 75% tamanho para as Transactions quando a tela está em pé e 100% quando está deitado
                height: availableheight * (isLandScape ? 1 : 0.75),
                // Chama as Transactions
                child: TransactionList(_transactions, _removeTransaction),
              ),
            ],
          ),
        ),
    );

    return Platform.isIOS ? 
    CupertinoPageScaffold( // "Scaffold" do IOS
      navigationBar: CupertinoNavigationBar( // "AppBar" do IOS
              middle: const Text(
                'Despesas Pessoais',
                style: TextStyle(
                  fontSize: 29,
                  ),
                ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min, // Reduz o tamanho para ocupar exatamente o necessário
                children: actions,
              ),
            ),
      child: bodyPage, 
    )
    : Scaffold(
      //resizeToAvoidBottomInset: true,
      appBar: appBar,
      body: bodyPage,

      // botão inferior
      floatingActionButton: Platform.isIOS ? // Detecta se está no IOS ou não 
      Container ()
      : FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        backgroundColor: Colors.amber,        
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: // posicionamenteo do botão inferior
          FloatingActionButtonLocation.centerFloat,
    );
  }
}