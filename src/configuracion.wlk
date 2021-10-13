import wollok.game.*
import personaje.*
import nivel1.*
import nivel2.*
import texto.*
import direcciones.*

object config{
    var property nivelActual = nivel1
    const personaje = new Protagonista(posicion = nivelActual.posicionInicial())
    
    method configuracionInicial(){
        self.setGameTitle()
        self.setGameSize()
        self.configurarNivelActual()
    }
    
    method configurarNivelActual(){
        nivelActual.generarNivel()
        self.configTeclas()
        self.configObjects()
        self.configurarColiciones()
    }

    method setGameTitle(){
        game.title("Carpinchos al ataque!")
    }

    method setGameSize(){
        game.cellSize(64)
	    game.height(11)
	    game.width(18)
    }

    method configObjects(){       
        personaje.posicion(nivelActual.posicionInicial())
        game.addVisual(personaje)
    }

    method configTeclas(){
        keyboard.left().onPressDo({ personaje.moverPara(izquierda) })
	    keyboard.up().onPressDo({ personaje.moverPara(arriba) })
	    keyboard.right().onPressDo({ personaje.moverPara(derecha) })
	    keyboard.down().onPressDo({ personaje.moverPara(abajo) })
    }    

    method configurarColiciones() {
		game.onCollideDo(self.nivelActual().casilleroFinal(), {unPersonaje => unPersonaje.llegarALaMeta()})
		game.onCollideDo(personaje, {unObjeto => 
            if (unObjeto.esLetal())
                personaje.morirse()
        })
        
	}

    method pasarDeNivel(){
        nivelActual = nivelActual.proximoNivel()
        self.eliminarTablero()
        self.configurarNivelActual()
    }

    method eliminarTablero(){
        game.clear()
    }
}