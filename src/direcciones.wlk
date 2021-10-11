object izquierda{
	method direccionOpuesta() = return derecha
	method proximaPosicion(posicionActual) = posicionActual.left(1) 
}

object derecha{
	method direccionOpuesta() = return izquierda
	method proximaPosicion(posicionActual) = posicionActual.right(1) 
}

object abajo{
	method direccionOpuesta() = return arriba
	method proximaPosicion(posicionActual) = posicionActual.down(1) 
}

object arriba{
	method direccionOpuesta() = return abajo
	method proximaPosicion(posicionActual) = posicionActual.up(1) 
}