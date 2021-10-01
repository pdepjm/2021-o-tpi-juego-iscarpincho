import wollok.game.*

class Casillero {
    const property posicion = game.at(0,0)

    method render() {
        game.addVisual(self)
    }
    
    method position() = posicion

    // method pasarDeNivel() {
    //     game.removeVisual(self)
    //     game.addVisual(self)
    // }
}

class ConjuntoDeParedes {
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
}

class Pared inherits Casillero {
    const property puedePisarse = false

    method image() {
        return "./assets/pared.png"
    }

}

class Camino inherits Casillero {
    const property puedePisarse = true

    method image() {
        return "./assets/camino.png"
    }
}
