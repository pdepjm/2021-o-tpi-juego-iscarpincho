import wollok.game.*

class Casillero {
    const property position

    method render() {
        game.addVisual(self)
    }

    // method redraw() {
    //     game.removeVisual(self)
    //     game.addVisual(self)
    // }
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