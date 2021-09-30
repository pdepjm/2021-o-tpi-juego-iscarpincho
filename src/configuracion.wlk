import wollok.game.*
import personaje.*
//import nivel1.*
import texto.*

object config{
    
    method configuracionInicial(){
        self.setGameTitle()
        self.setGameSize()
        self.configObjects()
        self.configTeclas()
        //nivel1.generarNivel()
    }

    method setGameTitle(){
        game.title("Carpinchos vs nordelta")
    }

    method setGameSize(){
        game.cellSize(64)	
	    game.height(11)
	    game.width(15)
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