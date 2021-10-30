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

    method puedeComerse() = true

    method puedePisarse() = true

    method puedePisarloElEnemigo() = true

    method esLetal() = false

    method esFullLetal() = false

}

class Manzana inherits Comida{
    override method nombre() = "manzana"
    
    method producirEfecto(){
        vida.modificar(1)
    }
}

class Pescado inherits Comida{
    override method nombre() = "pescado"
    
    method producirEfecto(){
        vida.modificar(3)
    }
    
}

class Helado inherits Comida{
    override method nombre() = "helado"
    
    method producirEfecto(){
        personaje.estaBloqueado(true)
        game.say(personaje, "ME CONGELE !!")
        game.schedule(2500, { => 
            personaje.estaBloqueado(false)
        })
    }
    
}

class Hamburguesa inherits Comida{
    override method nombre() = "hamburguesa"
    
    method producirEfecto(){
        vida.modificar(-1)
    }
}