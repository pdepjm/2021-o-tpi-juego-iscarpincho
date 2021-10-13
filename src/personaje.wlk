import wollok.game.*
import direcciones.*
import configuracion.*
import tablero.*

class Personaje{
	var property posicion = game.at(0,0)
	var property direccionActual = derecha

	method position() = posicion
	
	method moverPara(direccion) {
		if (self.puedeMoversePara(direccion) && posicion != config.nivelActual().posicionFinal()){
			self.cambiarDireccion(direccion)
			posicion = direccion.proximaPosicion(posicion)
		}
	}

	method cambiarDireccion(direccion){
		direccionActual = direccion
	}

	method image() = self.nombre() + "_" + direccionActual.nombre() + ".png"
	
	method puedeMoversePara(direccion) = not self.tieneEnfrenteAlgo(new Pared(), direccion.proximaPosicion(posicion))

	method tieneEnfrenteAlgo(algo, coordenadas) = config.nivelActual().hayAlgo(algo, coordenadas)

	method puedePisarse() = true

	method esLetal() = false

	method nombre() = "personaje"
	
}

class Protagonista inherits Personaje{

	override method nombre() = "personaje"

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
	override method nombre() = "enemigo"
	
	method desplazarse(){  
		if(not self.puedeMoversePara(direccionActual))
			direccionActual = direccionActual.direccionOpuesta()
		self.moverPara(direccionActual)
	}

	override method esLetal() = true
	
	override method puedeMoversePara(direccion) = super(direccion) and not self.tieneEnfrenteAlgo(new Agua(), direccion.proximaPosicion(posicion))
}	
