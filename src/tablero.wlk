import wollok.game.*

class Casillero {
    const property posicion = game.at(0,0)

    method render() {
        game.addVisual(self)
    }

    //predeterminados para la mayoria:
    method puedePisarse() = true
    method esLetal() = false
    
    method position() = posicion
}

class Pared inherits Casillero {
    override method puedePisarse() = false

    method image() {
        return "./assets/pared.png"
    }

    method esDeLaMismaClase(objeto) = not objeto.puedePisarse()

}

class Camino inherits Casillero {
    method image() {
        return "./assets/camino.png"
    }
}

class CasilleroInicial inherits Camino {
    override method image() {
        return "./assets/bloqueinicial.png"
    }
}

class CasilleroFinal inherits Camino {
    override method image() {
        return "./assets/bloquefinal.png"
    }
}

class Agua inherits Casillero {
    override method esLetal() = true
    
    method image() {
        return "./assets/agua.png"
    }

    method esDeLaMismaClase(objeto) = objeto.esLetal()
}

class ConjuntoDeCasilleros{
    const inicio = game.at(0,0)
    const fin = game.at(0,0)
    const orientacion = "x"
}

class ConjuntoDeParedes inherits ConjuntoDeCasilleros{
    method render(){
        constructorDeBloques.construir(inicio, fin, orientacion, creadorDePared)
    }
}

class ConjuntoDeAguas inherits ConjuntoDeCasilleros{
    method render(){
        constructorDeBloques.construir(inicio, fin, orientacion, creadorDeAgua)
    }
}

object constructorDeBloques{
    method construir(inicio, fin, orientacion, creador){
        orientacion.rango(inicio, fin).forEach{n => game.addVisualIn(creador.crear(), orientacion.coordenada(inicio, n))}
    }
}

object creadorDePared {
  method crear() = new Pared()
}

object creadorDeAgua {
  method crear() = new Agua()
}

object orientacionVertical{
    method rango(inicio, fin) = (inicio.y() .. fin.y())
    
    method coordenada(inicio, n) = game.at(inicio.x(), n)
}

object orientacionHorizontal{
    method rango(inicio, fin) = (inicio.x() .. fin.x())

    method coordenada(inicio, n) = game.at(n, inicio.y())
}