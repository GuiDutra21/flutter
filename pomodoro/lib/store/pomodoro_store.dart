import 'dart:async';
import 'package:mobx/mobx.dart';
part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo { TRABALHANDO, DESCANSANDO }

abstract class _PomodoroStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 5;

  @observable
  int tempoDescanso = 5;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.DESCANSANDO;

  @observable
  int minutos = 0;

  _PomodoroStore() {
    minutos = tipoIntervalo == TipoIntervalo.TRABALHANDO
        ? tempoTrabalho
        : tempoDescanso;
  }

  Timer? cronometro;

  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
    if (estaTrabalhando()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoTrabalho() {
    if (tempoTrabalho > 1) {
      tempoTrabalho--;
    }
    if (estaTrabalhando()) {
      reiniciar();
    }
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
    if (estaDescansando()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoDescanso() {
    if(tempoDescanso > 1)
    {
      tempoDescanso--;
    }
    if(estaDescansando())
    {
      reiniciar();
    }
  }

  @action
  void iniciar() {
    iniciado = true;
    cronometro = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (minutos == 0 && segundos == 0) {
        _trocarTipoIntervalo();
      } else if (segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }
    });
  }

  @action
  void parar() {
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void reiniciar() {
    parar();
    minutos = estaTrabalhando() ? tempoTrabalho : tempoDescanso;
    segundos = 0;
  }

  bool estaTrabalhando() {
    return tipoIntervalo == TipoIntervalo.TRABALHANDO;
  }

  bool estaDescansando() {
    return tipoIntervalo == TipoIntervalo.DESCANSANDO;
  }

  void _trocarTipoIntervalo() {
    if (estaTrabalhando()) {
      tipoIntervalo = TipoIntervalo.DESCANSANDO;
      minutos = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.TRABALHANDO;
      minutos = tempoTrabalho;
    }
    segundos = 0;
  }
}
