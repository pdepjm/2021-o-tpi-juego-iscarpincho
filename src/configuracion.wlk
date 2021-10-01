import wollok.game.*
import personaje.*
import nivel1.*
import texto.*
import direcciones.*

object config{
    var property nivelActual = nivel1
    
    method configuracionInicial(){
        self.setGameTitle()
        self.setGameSize()
        self.configTeclas()
        nivel1.generarNivel()
        self.configObjects()
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
        game.addVisual(personaje)
    }

    method configTeclas(){
        keyboard.left().onPressDo({ personaje.moverPara(izquierda) })
	    keyboard.up().onPressDo({ personaje.moverPara(arriba) })
	    keyboard.right().onPressDo({ personaje.moverPara(derecha) })
	    keyboard.down().onPressDo({ personaje.moverPara(abajo) })
    }    

}