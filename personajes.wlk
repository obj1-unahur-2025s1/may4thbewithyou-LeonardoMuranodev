class Planeta {
  var poblacion
  const defensores = []

  //Metodos de consulta
  method poblacion() = poblacion
  method potenciaTotal() = defensores.sum({d => d.potencia()})
  method elMasFuerte() = defensores.max({d => d.potencia()})

  //Metodos de indicacion
  method sufrirInvasion(intensidadDeAtaque) {
    if (intensidadDeAtaque > self.potenciaTotal()) {
      poblacion = poblacion * 0.9
    }
  }

  method agregarDefensores(listaDefensores) {
    defensores.addAll(listaDefensores)
  }

  method quitarDefensor(unDefensor) {
    defensores.remove(unDefensor)
  }
}

class LiderDeLaRebelion{ 
  const escuadron = []

  //Metodos de consulta
  method potencia() = (self.elMasFuerte().potencia() + self.elMasDebil().potencia()).div(2) + if (self.estaBalanceado()) 30 else 0
  method estaBalanceado() = (self.elMasFuerte().potencia() - self.elMasDebil().potencia()) < 100
  method elMasFuerte() = escuadron.max({m => m.potencia()})
  method elMasDebil() = escuadron.min({m => m.potencia()})

  //Metodos de indicacion
  method agregarMiembros(listaDeMiembros) {
    escuadron.addAll(listaDeMiembros)
  }

  method quitarMiembro(unMiembro) {
    escuadron.remove(unMiembro)
  }
}


object arturito {
  var bateria = 50

  //Metodos de consulta
  method valentia() = 10
  method potencia() = bateria * self.valentia()

  //Metodos de indicacion
  method cargarBateria() { bateria = 100}
  method descargarBateria() {bateria  = 0.max(bateria - 1)}
}

object hanSolo {
  var arma = blasterDeEnergia
  var estaCongelado = true

  //metodos de consulta
  method potencia() = if (estaCongelado) 0 else arma.energia() * 2

  //metodos de indicacion
  method cambiarArma(unArma) {arma = unArma}
  method descongelarse() {estaCongelado = false}
}

object chewbacca {
  method potencia() = 200
}

//Armas

object blasterDeEnergia {
  method energia() = 70
}

object blasterModular {
  const partes = []

  method energia() = partes.sum({p=> p.energia()})

  method agregarPartes(listaPartes) {
    partes.addAll(listaPartes)
  }

  method quitarParte(unaParte) {
    partes.remove(unaParte)
  }
}

//Partes del blaster modular

object cargador {
  method energia() = 20
}

object lenteDeEnfoqueDePlasma {
  method energia() = 30
}

object silenciador {
  method energia() = 10
}

object bateriaExtendida {
  method energia() = 50
}