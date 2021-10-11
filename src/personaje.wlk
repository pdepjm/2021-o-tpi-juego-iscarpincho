import wollok.game.*
import direcciones.*
import configuracion.*

class Personaje{
	var property posicion = config.nivelActual().posicionInicial()

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
	
	method puedeMoversePara(direccion) = not self.tieneEnfrenteUnaPared(direccion.proximaPosicion(posicion))
	
	method tieneEnfrenteUnaPared(coordenadas) = config.nivelActual().hayUnaPared(coordenadas)

	
}

class Protagonista inherits Personaje{
			
	method estaEnElAgua() = game.getObjectsIn(posicion).any{unObjeto => unObjeto.esLetal() == true}

	method llegarALaMeta(){
		game.say(self,"GANE!!")	
		//self.inmovilizar()
		game.schedule(1000, { => config.pasarDeNivel()})	
	}

	method morirse(){
		game.say(self,"ME MORI!! F :(")
		game.schedule(100, { => posicion = config.nivelActual().posicionInicial()})
	}
}


class Enemigo inherits Personaje{
	const tipoDeMovimiento = "horizontal"
			
	override method image(){
		return "enemigo.png"
	} 
	
	override method puedeMoversePara(direccion){
		if(tipoDeMovimiento == "horizontal"){
			return (direccion == derecha or direccion == izquierda) and 
				super(direccion)
		}else{
			return (direccion == arriba or direccion == abajo) and
			super(direccion)
		}
	}
	
	/**
		Metodo recursivo 
	*/
	override method moverPara(dirInit){
		const movimiento =  self.puedeMoversePara(dirInit)
			if(movimiento){
				super(dirInit)
				self.moverPara(dirInit)
			}else{
				super(dirInit.direccionOpuesta())
				self.moverPara(dirInit)
			}
	}
	
}	
