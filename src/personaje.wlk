import wollok.game.*
import direcciones.*

object personaje {
	//	TODO: No dejar que se vaya de pantalla
	var posicion = game.center()

	method image() {
		return "personaje.png"
	}
	
	method position() {
		return posicion
	} 
	
	method moverPara(direccion) {
		posicion = direccion.proximaPosicion(posicion) 
	}
}