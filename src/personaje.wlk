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
	
	method puedeMoversePara(direccion) 

	method moverPara(direccion) {
		if (self.puedeMoversePara(direccion)){
			self.cambiarDireccion(direccion)
			posicion = direccion.proximaPosicion(posicion)
		}
	}

	method cambiarDireccion(direccion){
		direccionActual = direccion
	}	
}

class Protagonista inherits Personaje{
	var estaBloqueado = false

	override method nombre() = "personaje"

	method puedePisarloElEnemigo() = true

	method generarProtagonista(unaPosicion){
		posicion = unaPosicion
		game.addVisual(self)
	}

	method desbloquear() {
		estaBloqueado = false
	}
	
	method llegarALaMeta(){
		game.say(self,"GANE!!")	
		game.schedule(1000, { => levelManager.pasarDeNivel()})
		estaBloqueado = true
	}

	method morirse(){
		game.say(self,"ME MORI!!")
		estaBloqueado = true
		game.schedule(500, { => 
			posicion = levelManager.nivelActual().posicionInicial()
			estaBloqueado = false
		})
	}

	method puedeMoversePara(direccion) = self.puedePisarlos(game.getObjectsIn(direccion.proximaPosicion(posicion))) && not estaBloqueado

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