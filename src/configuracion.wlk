import wollok.game.*
import personaje.*
import nivel1.*
import nivel2.*
import texto.*
import direcciones.*

object config{
    
    method configuracionInicial(){
        self.setGameTitle()
        self.setGameSize()
        levelManager.configurarNivelActual()
    }
    
    method setGameTitle(){
        game.title("Carpinchos al ataque!")
    }

    method setGameSize(){
        game.cellSize(64)
	    game.height(11)
	    game.width(18)
    }

    method configurarTeclas(){
        keyboard.left().onPressDo{personaje.moverPara(izquierda)}
	    keyboard.up().onPressDo{personaje.moverPara(arriba)}
	    keyboard.right().onPressDo{personaje.moverPara(derecha)}
	    keyboard.down().onPressDo{personaje.moverPara(abajo)}
    }    

    method configurarColisiones() {
		game.onCollideDo(levelManager.nivelActual().casilleroFinal(), {unPersonaje => unPersonaje.llegarALaMeta()})
		game.onCollideDo(personaje, {unObjeto => 
            if (unObjeto.esLetal())
                personaje.morirse()
        })
	}
}

object levelManager{
    var property nivelActual = nivel1

    method configurarNivelActual(){
        nivelActual.generarNivel()
        personaje.generarProtagonista(nivelActual.posicionInicial())
        nivelActual.generarEnemigos()
        config.configurarTeclas()
        config.configurarColisiones()
    }
    
    method pasarDeNivel(){
        nivelActual = nivelActual.proximoNivel()
        self.eliminarTablero()
        self.configurarNivelActual()
        personaje.desbloquear()
    }

    method eliminarTablero(){
        game.clear()
    }
}