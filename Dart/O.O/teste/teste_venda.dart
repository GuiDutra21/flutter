import '../modelo/cliente.dart';
import '../modelo/produto.dart';
import '../modelo/venda_item.dart';
import '../modelo/venda.dart';

main()
{
  /*var comprador = Cliente(nome: 'Guilherme Silva Dutra', cpf: '027.519.131.13');//cliente

  //produtos
  var produto1 = Produto(codigo: 1000,nome: 'lapis',preco: 2.50);
  var produto2 = Produto(codigo: 1001, nome: 'Borracha', preco: 3.00, desconto: 0.1);
  var produto3 = Produto(nome: 'Cadero', preco: 25.50,codigo: 1002,desconto: 0.1);

  //itens
  var vendaItem1 = VendaItem(produto: produto1,quantidade: 2);
  var vendaItem2 = VendaItem(quantidade: 2, produto: produto2);
  var vendaItem3 = VendaItem(produto: produto3, quantidade: 3);
  
  //lita dos itens
  var vendas = [vendaItem1,vendaItem2,vendaItem3]; 

  //Venda como um todo
  var vendaFinal = Venda(cliente: comprador,itens: vendas);

  print('O cliente ${comprador.nome} de cpf : ${comprador.cpf} realizou a compra do(s) seguinte(s) item(s) :'
  '${vendas.map((nome) => nome.produto!.nome)} com as respectivas quantidades : ${vendas.map((quantidade) => quantidade.quantidade)}'
  ' \nQue no final gerou o seguinte preço total : ${vendaFinal.valorTotal} reais');
  */

  var venda = Venda(

      cliente: Cliente(
        nome: 'Guilherme Silva Dutra',
        cpf: '027.519.131-13'
      ),

      itens: <VendaItem>[

        VendaItem(
          quantidade: 3,
          produto: Produto(
            codigo: 1000,
            nome: 'lapis',
            preco: 6.00,
            desconto: 0.5 
          )
        ),

        VendaItem(
          quantidade: 2,
          produto: Produto(
            codigo: 1001,
            nome: 'Borracha',
            preco: 3.00,
            desconto: 0.1
          )
        ),

        VendaItem(
          quantidade: 3,
          produto: Produto(
            codigo: 1002,
            nome: 'Caderno',
            preco: 25.50,
            desconto: 0.1
          )
        )
      ]
  );

  print("O valor total da venda é: R\$${venda.valorTotal}");
  print("Nome do primeiro produto é: ${venda.itens[0].produto!.nome}");
  print("O CPF do cliente é: ${venda.cliente!.cpf}");
}