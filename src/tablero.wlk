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
}

/*class ConjuntoDeParedes {
    const inicio = game.at(0,0) 
    const fin = game.at(0,0)
    const orientacion = "x"

    method render() {
        var bloques = []
        if(orientacion == "x") {
            const anchoPared = ((inicio.x()) .. (fin.x()))
            bloques = anchoPared.map{x => return new Pared(posicion = game.at(x,inicio.y()))}
        } else if(orientacion == "y") {
            const altoPared = ((inicio.y()) .. (fin.y()))
            bloques = altoPared.map{y => return new Pared(posicion = game.at(inicio.x(),y))}
        }
        bloques.forEach{unBloque => unBloque.render()}
    }
}*/

class ConjuntoDeCasilleros{
    const inicio = game.at(0,0)
    const fin = game.at(0,0)
    const orientacion = "x"
}

class ConjuntoDeParedes inherits ConjuntoDeCasilleros{
    method render(){
        constructorParedes.constructorDeBloques(inicio, fin, orientacion)
    }
}

class ConjuntoDeAguas inherits ConjuntoDeCasilleros{
    method render(){
        constructorAguas.constructorDeBloques(inicio, fin, orientacion)
    }
}

object constructorParedes{
    method constructorDeBloques(inicio, fin, orientacion){
        if (orientacion == "y")
		    (inicio.y() .. fin.y()).forEach{n => game.addVisualIn(new Pared(), game.at(inicio.x(),n))}
        else
            (inicio.x() .. fin.x()).forEach{n => game.addVisualIn(new Pared(), game.at(n,inicio.y()))}
    }
}

object constructorAguas{
    method constructorDeBloques(inicio, fin, orientacion){
        if (orientacion == "y")
		    (inicio.y() .. fin.y()).forEach{n => game.addVisualIn(new Agua(), game.at(inicio.x(),n))}
        else
            (inicio.x() .. fin.x()).forEach{n => game.addVisualIn(new Agua(), game.at(n,inicio.y()))}
    }
}