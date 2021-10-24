import wollok.game.*
import tablero.*
import nivel.*
import direcciones.*
import personaje.*
import comidas.*

const nivel3 = new Nivel(
    casilleros = [
        new ConjuntoDeParedes( // Pared inferior
            inicio = game.at(0,0),
            fin = game.at(17,0),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeParedes( // Pared izquierda
            inicio = game.at(0,1),
            fin = game.at(0,10),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeParedes( // Pared superior
            inicio = game.at(0, 10),
            fin = game.at(17, 10),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeParedes( // Pared derecha
            inicio = game.at(17,1),
            fin = game.at(17, 10),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeParedes(
            inicio = game.at(2,6),
            fin = game.at(2, 8),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeParedes(
            inicio = game.at(3,6),
            fin = game.at(3, 8),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeParedes(
            inicio = game.at(2,5),
            fin = game.at(4, 5),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeParedes(
            inicio = game.at(10,1),
            fin = game.at(10, 4),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeParedes(
            inicio = game.at(12,2),
            fin = game.at(12, 4),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeParedes(
            inicio = game.at(10,5),
            fin = game.at(12, 5),
            orientacion = orientacionHorizontal
        ),
        
        new ConjuntoDeAguas(
            inicio = game.at(1,1),
            fin = game.at(3,1),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeAguas(
            inicio = game.at(5,2),
            fin = game.at(5,5),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeAguas(
            inicio = game.at(11,7),
            fin = game.at(11,9),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeAguas(
            inicio = game.at(12,7),
            fin = game.at(12,9),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeAguas(
            inicio = game.at(13,2),
            fin = game.at(13,5),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeAguas(
            inicio = game.at(14,2),
            fin = game.at(14,5),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeAguas(
            inicio = game.at(15,2),
            fin = game.at(15,5),
            orientacion = orientacionVertical
        ),

        new ConjuntoDeFuegos(
            inicio = game.at(6,2),
            fin = game.at(6,4),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeFuegos(
            inicio = game.at(7,2),
            fin = game.at(7,3),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeFuegos(
            inicio = game.at(7,4),
            fin = game.at(8,4),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeFuegos(
            inicio = game.at(6,5),
            fin = game.at(9,5),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeFuegos(
            inicio = game.at(9,1),
            fin = game.at(9,2),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeFuegos(
            inicio = game.at(13,9),
            fin = game.at(16,9),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeFuegos(
            inicio = game.at(14,7),
            fin = game.at(16,7),
            orientacion = orientacionHorizontal
        )
    ],
    enemigos = [
        new Enemigo(direccionActual = arriba, posicion = game.at(9,6)),
        new Enemigo(direccionActual = abajo, posicion = game.at(7,9)),
        new Enemigo(direccionActual = arriba, posicion = game.at(5,6)),
        new Enemigo(direccionActual = derecha, posicion = game.at(1,4)),
        new Enemigo(direccionActual = izquierda, posicion = game.at(4,2))
    ],
    comidas = [
        new Pescado(posicion = game.at(16,8)),
        new Hamburguesa(posicion = game.at(8,6)),
        new Manzana(posicion = game.at(8,9)),
        new Helado(posicion = game.at(5,7)),
        new Helado(posicion = game.at(2,2)),
        new Helado(posicion = game.at(3,2)),
        new Hamburguesa(posicion = game.at(7,1))
    ],
    casilleroInicial = new CasilleroInicial(posicion = game.at(11,4)),
    casilleroFinal = new CasilleroFinal(posicion = game.at(9,4)),
    proximoNivel = nivel3
)
