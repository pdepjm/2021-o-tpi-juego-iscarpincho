import wollok.game.*
import direcciones.*
import configuracion.*

object personaje {
	var property posicion = config.nivelActual().posicionInicial()

	method image() {
		return "personaje.png"
	}
	
	method position() {
		return posicion
	}
	
	method moverPara(direccion) {
		if (self.puedeMoversePara(direccion)){
			posicion = direccion.proximaPosicion(posicion)
			// if(self.estaEnElAgua())
			// 	self.morirse()
		}
	}
	
	method puedeMoversePara(direccion) = not self.tieneEnfrenteUnaPared(direccion.proximaPosicion(posicion))
	
	method tieneEnfrenteUnaPared(coordenadas) = config.nivelActual().hayUnaPared(coordenadas)
	//method tieneEnfrenteUnaPared(coordenadas) = game.getObjectsIn(coordenadas).any{unObjeto => not unObjeto.puedePisarse()}

	method estaEnElAgua() = game.getObjectsIn(posicion).any{unObjeto => unObjeto.esLetal() == true}

	method llegarALaMeta(){
		game.say(self,"GANE!!")	
		//self.inmovilizar()
		game.schedule(1000, { => config.pasarDeNivel()})	
	}

	method morirse(){
		game.say(self,"ME MORI!! F :(")
		game.schedule(3000, { => posicion = config.nivelActual().posicionInicial()})
	}
}