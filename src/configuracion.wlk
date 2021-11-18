import wollok.game.*
import personaje.*
import nivel1.*
import nivel2.*
import nivel3.*
import texto.*
import direcciones.*
import comidas.*

object config{
	
	method configComun(){
		self.setGameTitle()
        self.setGameSize()
	}
    
    method configuracionInicial(){
        self.configComun()
        levelManager.configurarNivelActual()
    }
    
    method configurarNivel(levelAdmin){
    	self.configComun()
    	levelAdmin.configurarNivelActual()
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
        game.onCollideDo(personaje, {unObjeto => unObjeto.colisionarConPersonaje()})
	}


}

object levelManager{
    var property nivelActual = nivel1
    const nivelFinal = nivel3

    method configurarNivelActual(){
        nivelActual.generarNivel()
        personaje.generarProtagonista(nivelActual.posicionInicial())
        nivelActual.generarComida()
        nivelActual.generarEnemigos()
        config.configurarTeclas()
        config.configurarColisiones()
        game.addVisual(vida)
        game.addVisual(texto)
    }
    
    method pasarDeNivel(){
        nivelActual = nivelActual.proximoNivel()
        self.eliminarTablero()
        self.configurarNivelActual()
        vida.reiniciarVida()
        personaje.desbloquear()
    }

    method terminarJuego(){
        game.schedule(500, { => nivelActual.cantDeEnemigos().times{ i => game.removeTickEvent("movimientoEnemigo")}}) // Frena a los malos
		game.schedule(3000, { => game.stop()})
    }

    method eliminarTablero(){
        game.clear()
    }

    method esElFinal() = nivelActual == nivelFinal

}