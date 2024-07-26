void main() {
   List lista = []; 
   lista.add(1); 
   lista.add(2); 

   var lista2 = [0,0,0,0]; 
   lista2[0] = 1; 
   lista2[1] = 2; 
   lista2[2] = 3; 
   print(lista); 
   print(lista2); 

   List<String> aprovados = ['ana', 'lucas', 'pedro', 'vitor'];
   print(aprovados);
   print(aprovados[2]);
   print(aprovados.elementAt(3));
   print(aprovados.length);
   // a lista aceita repeticao

   Map <String, String> telefones = // Map
   {
    'joao' : '+55 (11) 99999-9999',// keys and values   
    'ana' : '+55 (22) 99898-0909',
    'maria' : '+55 (31) 91617-0909', 
   };
    print(telefones is Map);
    print(telefones['joao']);
    print(telefones.length);
    print(telefones.values);
    print(telefones.keys);
    print(telefones.entries);
    // nao aceita repeticao, sendo o ultimo elemento repetido o referente

   Set <String> times = {'Vasco','Flamengo','Botafogo'};//set
   // o set nao eh indexado
   // set nao aceita repeticao
   print(times is Set);
   times.add('Palmeiras');
   times.add('Palmeiras');
   print(times.length);
   print(times.contains('Vasco'));// true or false
   print(times.first);
   print(times.last);
   print(times);
}
