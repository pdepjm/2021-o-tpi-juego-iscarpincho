import wollok.game.*
import personaje.*

class Casillero {
    const property posicion = game.at(0,0)

    method position() = posicion

    method render() {
        game.addVisual(self)
    }

    method colisionarConPersonaje(){}

    //predeterminados para la mayoria:
    method puedePisarse() = true

    method puedePisarloElEnemigo() = true

}

class Pared inherits Casillero {
    override method puedePisarse() = false

    override method puedePisarloElEnemigo() = false

    method image() = "./assets/pared.png"
    
}

class Camino inherits Casillero {
    method image() = "./assets/camino.png"
}

class CasilleroInicial inherits Camino {
    override method puedePisarloElEnemigo() = false

    override method image() = "./assets/bloqueinicial.png"
}

class CasilleroFinal inherits Camino {
    override method puedePisarloElEnemigo() = false

    override method image() = "./assets/bloquefinal.png"
}

class Agua inherits Casillero {

    override method colisionarConPersonaje(){
        personaje.perderUnaVida()
    }

    override method puedePisarloElEnemigo() = false

    method image() = "./assets/agua.png"
}

class Fuego inherits Casillero {

    override method colisionarConPersonaje(){
        personaje.morirse()
    }

    override method puedePisarloElEnemigo() = false
    
    method image() = "./assets/fuego.gif"
}

class ConjuntoDeCasilleros{
    const inicio = game.at(0,0)
    const fin = game.at(0,0)
    const orientacion = orientacionHorizontal

    method crear() 

    method render(){
        orientacion.rango(inicio, fin).forEach{n => game.addVisualIn(self.crear(), orientacion.coordenada(inicio, n))}
    }
}

class ConjuntoDeParedes inherits ConjuntoDeCasilleros{
	override method crear() = new Pared()
}

class ConjuntoDeAguas inherits ConjuntoDeCasilleros{
	override method crear() = new Agua()
}

class ConjuntoDeFuegos inherits ConjuntoDeCasilleros{
	override method crear() = new Fuego()
}

object orientacionVertical{
    method rango(inicio, fin) = (inicio.y() .. fin.y())
    
    method coordenada(inicio, n) = game.at(inicio.x(), n)
}

object orientacionHorizontal{
    method rango(inicio, fin) = (inicio.x() .. fin.x())

    method coordenada(inicio, n) = game.at(n, inicio.y())
}