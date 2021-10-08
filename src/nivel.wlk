import wollok.game.*
import tablero.*
    
class Nivel{
	const paredes = []
	const aguas = []
    const property casilleroInicial = null
    const property casilleroFinal = null
    const property proximoNivel = null
    
    method generarNivel() {
        self.generarParedes()
        self.generarAgua()
        self.generarInicialYFinal()
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
                j => if (self.casilleroVacio(game.at(i,j))){
                    new Camino(posicion = game.at(i,j)).render()
                }
            }
        }
    }

    method casilleroVacio(pos) = game.getObjectsIn(pos).isEmpty()

    method generarAgua(){
        aguas.forEach {agua => agua.render()}
    }

    method generarInicialYFinal(){
        casilleroInicial.render()
        casilleroFinal.render()
    }

    method posicionInicial() = casilleroInicial.posicion()

    method posicionFinal() = casilleroFinal.posicion()

    method hayUnaPared(posicion) = game.getObjectsIn(posicion).any{unObjeto => not unObjeto.puedePisarse()} 
}



