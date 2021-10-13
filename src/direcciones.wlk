object izquierda{
	method direccionOpuesta() = derecha
	method proximaPosicion(posicionActual) = posicionActual.left(1)
	method nombre() = "izquierda" 
}

object derecha{
	method direccionOpuesta() = izquierda
	method proximaPosicion(posicionActual) = posicionActual.right(1)
	method nombre() = "derecha"
}

object abajo{
	method direccionOpuesta() = arriba
	method proximaPosicion(posicionActual) = posicionActual.down(1)
	method nombre() = "abajo"
}

object arriba{
	method direccionOpuesta() = abajo
	method proximaPosicion(posicionActual) = posicionActual.up(1)
	method nombre() = "arriba"
}