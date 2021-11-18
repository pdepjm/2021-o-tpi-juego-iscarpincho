import wollok.game.*
import direcciones.*
import configuracion.*
import tablero.*
import personaje.*

class Comida{
    const posicion

    method nombre()

    method position() = posicion
	
	method image() = self.nombre() + ".png"

    method render(){
        game.addVisual(self)
    }

    method colisionarConPersonaje(){
        game.removeVisual(self)
    }

    method puedePisarse() = true

    method puedePisarloElEnemigo() = true
}

class Manzana inherits Comida{
    override method nombre() = "manzana"
    
    override method colisionarConPersonaje(){
        vida.modificar(1)
        super()
    }
}

class Pescado inherits Comida{
    override method nombre() = "pescado"
    
    override method colisionarConPersonaje(){
        vida.modificar(3)
        super()
    }
    
}

class Helado inherits Comida{
    override method nombre() = "helado"
    
    override method colisionarConPersonaje(){
        personaje.congelarse()
        super()
    }    
}

class Hamburguesa inherits Comida{
    override method nombre() = "hamburguesa"
    
    override method colisionarConPersonaje(){
        vida.modificar(-1)
        super()
    }
}