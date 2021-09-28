import wollok.game.*

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

object izquierda {
	method proximaPosicion(posicionActual) = posicionActual.left(1) 
}

object derecha {
	method proximaPosicion(posicionActual) = posicionActual.right(1) 
}

object abajo {
	method proximaPosicion(posicionActual) = posicionActual.down(1) 
}

object arriba {
	method proximaPosicion(posicionActual) = posicionActual.up(1) 
}