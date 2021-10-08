import wollok.game.*
import personaje.*
import nivel1.*
import nivel2.*
import texto.*
import direcciones.*

object config{
    var property nivelActual = nivel1
    
    method configuracionInicial(){
        self.setGameTitle()
        self.setGameSize()
        self.configTeclas()
        self.configurarNivelActual()
    }
    
    method configurarNivelActual(){
        nivelActual.generarNivel()
        self.configObjects()
        self.configurarColiciones()
    }

    method setGameTitle(){
        game.title("Carpinchos vs nordelta")
    }

    method setGameSize(){
        game.cellSize(64)
	    game.height(11)
	    game.width(18)
    }

    method configObjects(){
        game.addVisual(texto)
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
		game.onCollideDo(self.nivelActual().casilleroFinal(), {personaje => personaje.llegarALaMeta()})
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
        const ancho = (0 .. (game.width()-1))
        const alto = (0 .. (game.height()-1))
        ancho.forEach{
            i => alto.forEach{
                j => game.getObjectsIn(game.at(i,j)).forEach{unObjeto => game.removeVisual(unObjeto)}
            }
        }
    }
}