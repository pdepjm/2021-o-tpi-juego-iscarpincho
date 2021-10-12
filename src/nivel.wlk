import wollok.game.*
import tablero.*
import direcciones.*
import personaje.*
    
class Nivel{
	const casilleros = []
    const property casilleroInicial = null
    const property casilleroFinal = null
    const property proximoNivel = null
    const enemigos = []

    method generarNivel() {
        self.generarCasilleros()
        self.generarInicialYFinal()
        self.generarCaminos()
        self.generarEnemigos()
    }   

    method generarCasilleros(){
        casilleros.forEach {casillero => casillero.render()}
    }

    method generarCaminos(){
        const ancho = []
        const alto = []
        game.width().times{i => ancho.add(i-1)}
        game.height().times{i => alto.add(i-1)}
        ancho.forEach{
            i => alto.forEach{
                j => if (self.casilleroVacio(game.at(i,j))){
                    new Camino(posicion = game.at(i,j)).render()
                }
            }
        }
    }

    method generarEnemigos(){
        enemigos.forEach{enemigo => 
            game.addVisual(enemigo)
            game.onTick(500, "movimientoEnemigo", { => enemigo.desplazarse()})
        }
    }

    method casilleroVacio(pos) = game.getObjectsIn(pos).isEmpty()

    method generarInicialYFinal(){
        casilleroInicial.render()
        casilleroFinal.render()
    }

    method posicionInicial() = casilleroInicial.posicion()

    method posicionFinal() = casilleroFinal.posicion()

    method hayAlgo(algo, posicion) = game.getObjectsIn(posicion).any{unObjeto => algo.esDeLaMismaClase(unObjeto)}
}




