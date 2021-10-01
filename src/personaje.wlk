import wollok.game.*
import direcciones.*
import configuracion.*


object personaje {
	var posicion = game.center()

	method image() {
		return "personaje.png"
	}
	
	method position() {
		return posicion
	} 
	
	method moverPara(direccion) {
		if (self.puedeMoversePara(direccion)){
			posicion = direccion.proximaPosicion(posicion)			
		}
	}
	
	method puedeMoversePara(direccion) = not self.tieneEnfrenteUnaPared(direccion.proximaPosicion(posicion))
	
	method tieneEnfrenteUnaPared(coordenadas) = config.nivelActual().hayUnaPared(coordenadas)
	//method tieneEnfrenteUnaPared(coordenadas) = game.getObjectsIn(coordenadas).any{unObjeto => not unObjeto.puedePisarse()}
}