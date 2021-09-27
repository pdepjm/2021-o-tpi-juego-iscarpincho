import wollok.game.*

class Nivel{
    var paredes = []
    var caminos = []

    method generarNivel() {
        caminos.forEach {camino => camino.render()}
        paredes.forEach {pared => pared.render()}
    }    
}