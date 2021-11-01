import wollok.game.*
import direcciones.*
import configuracion.*
import tablero.*

class Personaje{
	var property posicion = game.at(0,0)
	var property direccionActual = derecha

	method position() = posicion
	
	method image() = self.nombre() + "_" + direccionActual.nombre() + ".png"

	method nombre()
	
	method puedePisarse() = true

	method esLetal() = false
	
	method puedeComerse() = false

	method esFullLetal() = false

	method puedeMoversePara(direccion) 

	method moverPara(direccion) {
		if (self.puedeMoversePara(direccion)){
			self.cambiarDireccion(direccion)
			self.posicion(direccion.proximaPosicion(posicion))
			//posicion = direccion.proximaPosicion(posicion)
		}
	}

	method cambiarDireccion(direccion){
		direccionActual = direccion
	}	

}

class Protagonista inherits Personaje{
	var property estaMuerto = false
	var property estaBloqueado = false

	override method nombre() = "personaje"

	method puedePisarloElEnemigo() = true

	method desbloquear(){
		estaBloqueado = false
	}

	method generarProtagonista(unaPosicion){
		posicion = unaPosicion
		game.addVisual(self)
	}

	method llegarALaMeta(){
		estaBloqueado = true
		if (levelManager.esElFinal()){
			game.say(self,"GANE!!")
			levelManager.terminarJuego()
		}
		else{
			game.say(self,"PASE DE NIVEL!!")	
			game.schedule(1000, { => levelManager.pasarDeNivel()})		
		}
	}

	method perderUnaVida(){
		estaBloqueado = true
		vida.modificar(-1)
		if(!estaMuerto) {
			game.say(self,"PERDI UNA VIDA !!")
			game.schedule(500, { => 
			posicion = levelManager.nivelActual().posicionInicial()
			estaBloqueado = false
			})
		}
	}

	method morirse(){
		estaBloqueado = true
		estaMuerto = true
		game.say(self,"ME QUEDE SIN VIDAS :( !!")
		levelManager.terminarJuego()
	}

	override method puedeMoversePara(direccion) = self.puedePisarlos(game.getObjectsIn(direccion.proximaPosicion(posicion))) && not estaBloqueado

	method puedePisarlos(objetos) = objetos.all{unObjeto => unObjeto.puedePisarse()}

}

class Enemigo inherits Personaje{
	override method nombre() = "enemigo"
	
	override method esLetal() = true
	
	method desplazarse(){  
		if(not self.puedeMoversePara(direccionActual))
			direccionActual = direccionActual.direccionOpuesta()
		self.moverPara(direccionActual)
	}

	method render(){
		game.addVisual(self)
        game.onTick(500, "movimientoEnemigo", { => self.desplazarse()})
	}

	override method puedeMoversePara(direccion) = self.puedePisarlos(game.getObjectsIn(direccion.proximaPosicion(posicion)))

	method puedePisarlos(objetos) = objetos.all{unObjeto => unObjeto.puedePisarloElEnemigo()}
}	

const personaje = new Protagonista(posicion = levelManager.nivelActual().posicionInicial())

object vida{
	var property cantidad = 3

	method image() = "vida_" + cantidad.toString() + ".png"

	method position() = game.at(15,10)

	method modificar(cuanto){
		cantidad = 3.min(cantidad + cuanto)
		if (cantidad == 0){
			personaje.morirse()
		}
	}

	method reiniciarVida(){
		cantidad = 3
	}
}