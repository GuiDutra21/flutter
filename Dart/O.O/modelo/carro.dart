class Carro
{
  late int velocidadeMaxima = 0;
  int _velocidadeAtual = 0;

  Carro([velocidadeMaxima = 200])
  {
    this.velocidadeMaxima = velocidadeMaxima;
  }

  int get velocidadeAtual // método que permite a utilização da variável, mas não alteração
  {
    return this._velocidadeAtual;
  }

  void set velocidadeAtual(int novaVelocidade)// método que permite a alteração
  {
    bool deltaValido = (_velocidadeAtual - novaVelocidade).abs() <= 5;
    if(deltaValido)
    {
      this._velocidadeAtual = novaVelocidade;
    }
  }

  bool estaNoLimite()
  { 
   return _velocidadeAtual == velocidadeMaxima;
  }

  bool estaParado()
  {
    return _velocidadeAtual == 0;
  }
  
  int acelerar()
  {
    if((_velocidadeAtual + 5) >= velocidadeMaxima)
    {
      _velocidadeAtual = velocidadeMaxima;
      return _velocidadeAtual;
    }
    else
    {
      _velocidadeAtual += 5;
      return _velocidadeAtual;
    }
  }


  int freiar()
  {
    if((_velocidadeAtual - 5) <= 0)
    {
      return _velocidadeAtual = 0;
    }
    else
    {
      _velocidadeAtual -=5;
      return _velocidadeAtual;
    }
  }
}