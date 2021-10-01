import wollok.game.*
import tablero.*
    
class Nivel{
	const paredes = []
    method generarNivel() {
        self.generarParedes()
        self.generarCaminos()
    }   

    method generarParedes(){
        paredes.forEach {pared => pared.render()}
    }

    method generarCaminos(){
        const ancho = []
        const alto = []
        game.width().times{i => ancho.add(i-1)}
        game.height().times{i => alto.add(i-1)}
        ancho.forEach{
            i => alto.forEach{
                j => if (not self.hayUnaPared(game.at(i,j))){
                    new Camino(posicion = game.at(i,j)).render()
                }
            }
        }
    }

    method hayUnaPared(posicion) = game.getObjectsIn(posicion).any{unObjeto => not unObjeto.puedePisarse()} 
}