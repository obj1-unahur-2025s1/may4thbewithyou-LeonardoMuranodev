class Maestro {
  const property midiclorianos
  const property sableDeLuz
  var esperanza = 50
  var bando = ladoLuminoso

  //Metodos de consulta
  method esJedi() = esperanza > 0
  method potencia() = bando.potencia(self)

  //Metodos de indicacion
  method vivirSuceso(unSuceso) {
    bando.vivirSuceso(self, unSuceso)
  }

  method cambiarEsperanza(unValor) {
    esperanza = esperanza + unValor
  }

  method cambiarBando(unBando) {
    bando = unBando
  }
}

object ladoLuminoso {
  method potencia(unMaestro) = (unMaestro.midiclorianos() * 0.001 + unMaestro.sableDeLuz().energia()) * 10

  method vivirSuceso(unMaestro, unSuceso) {
    unMaestro.cambiarEsperanza(unSuceso.cargaEmocional()) 
    if (not unMaestro.esJedi()) {
      unMaestro.cambiarBando(ladoOscuro)
      ladoOscuro.aumentarFuerza()
    }
  }
}

object ladoOscuro {
  var fuerzaBando = 0

  //Metodos de consulta
  method potencia(unMaestro) = (unMaestro.midiclorianos() * 0.001 + unMaestro.sableDeLuz().enegia()) * fuerzaBando
  method fuerzaLadoOscuro() = fuerzaBando

  //Metodos de indicacion
  method vivirSuceso(unMaestro, unSuceso) {
    if (unSuceso.cargaEmocional() > 100) {
      unMaestro.cambiarEsperanza(unSuceso.cargaEmocional()) 
      unMaestro.cambiarBando(ladoLuminoso)
      self.disminuirFuerza()
    }
  }

  method aumentarFuerza() {
    fuerzaBando += 1
  }
  method disminuirFuerza() {
    fuerzaBando *= 0.5
  }
}

class CadenaDeSucesos {
  const sucesos = []
  method cargaEmocional() = sucesos.sum({s => s.cargaEmocional()})

  method agregarSuceso(unSuceso) {
    sucesos.addAll(unSuceso)
  }

  method quitarSuceso(unSuceso) {
    sucesos.remove(unSuceso)
  }
}

class Suceso {
  const property cargaEmocional
}

class SucesoGanarAmigo {
  const amigo

  method cargaEmocional() = amigo.potencia()
}

class SucesoPelearBatalla {
  const cantBajas

  method cargaEmocional() = cantBajas * -1
}

class SableDeLuz {
  const property energia
}

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