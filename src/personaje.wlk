import wollok.game.*
import direcciones.*
import configuracion.*
import tablero.*

class Personaje{
	var property posicion = game.at(0,0)

	method image() {
		return "personaje.png"
	}

	method position() {
		return posicion
	}
	
	method moverPara(direccion) {
		if (self.puedeMoversePara(direccion) && posicion != config.nivelActual().posicionFinal()){
			posicion = direccion.proximaPosicion(posicion)
		}
	}
	
	method puedeMoversePara(direccion) = not self.tieneEnfrenteAlgo(new Pared(), direccion.proximaPosicion(posicion))

	method tieneEnfrenteAlgo(algo, coordenadas) = config.nivelActual().hayAlgo(algo, coordenadas)

	method puedePisarse() = true

	method esLetal() = false
	
}

class Protagonista inherits Personaje{

	method llegarALaMeta(){
		game.say(self,"GANE!!")	
		game.schedule(1000, { => config.pasarDeNivel()})
	}

	method morirse(){
		game.say(self,"ME MORI!! F :(")
		game.schedule(100, { => posicion = config.nivelActual().posicionInicial()})
	}
}


class Enemigo inherits Personaje{
	var direccion = izquierda
			
	override method image(){
		return "enemigo.png"
	} 
	
	method desplazarse(){  
		if(not self.puedeMoversePara(direccion))
			direccion = direccion.direccionOpuesta()
		self.moverPara(direccion)
	}

	override method esLetal() = true
	
	override method puedeMoversePara(sentido) = super(sentido) and not self.tieneEnfrenteAlgo(new Agua(), sentido.proximaPosicion(posicion))
}	
