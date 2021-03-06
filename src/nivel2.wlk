import wollok.game.*
import tablero.*
import nivel.*
import nivel3.*
import direcciones.*
import personaje.*
import comidas.*

const nivel2 = new Nivel(
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
            inicio = game.at(2,9),
            fin = game.at(15, 9),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeParedes(
            inicio = game.at(2,8),
            fin = game.at(14, 8),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeParedes(
            inicio = game.at(10,7),
            fin = game.at(11, 7),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeParedes(
            inicio = game.at(1,1),
            fin = game.at(1, 5),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeParedes(
            inicio = game.at(2,1),
            fin = game.at(2, 5),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeParedes(
            inicio = game.at(3,1),
            fin = game.at(5, 1),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeParedes(
            inicio = game.at(6,5),
            fin = game.at(9, 5),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeParedes(
            inicio = game.at(7,4),
            fin = game.at(11, 4),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeParedes(
            inicio = game.at(8,3),
            fin = game.at(11, 3),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeParedes(
            inicio = game.at(15,1),
            fin = game.at(15,4),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeParedes(
            inicio = game.at(16,1),
            fin = game.at(16, 4),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeAguas(
            inicio = game.at(12,7),
            fin = game.at(15,7),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeAguas(
            inicio = game.at(1,6),
            fin = game.at(3,6),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeAguas(
            inicio = game.at(6,6),
            fin = game.at(9,6),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeAguas(
            inicio = game.at(3,2),
            fin = game.at(3,5),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeAguas(
            inicio = game.at(4,2),
            fin = game.at(5,2),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeAguas(
            inicio = game.at(4,2),
            fin = game.at(5,2),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeAguas(
            inicio = game.at(8,2),
            fin = game.at(12,2),
            orientacion = orientacionHorizontal
        ),
        new ConjuntoDeAguas(
            inicio = game.at(12,3),
            fin = game.at(12,4),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeAguas(
            inicio = game.at(14,1),
            fin = game.at(14,5),
            orientacion = orientacionVertical
        ),
        new ConjuntoDeAguas(
            inicio = game.at(15,5),
            fin = game.at(16,5),
            orientacion = orientacionHorizontal
        ),
        new Agua(posicion = game.at(15, 8)),
        new Agua(posicion = game.at(5, 5)),
        new Agua(posicion = game.at(6, 4)),
        new Agua(posicion = game.at(7, 3))

    ],
    enemigos = [
        new Enemigo(direccionActual = derecha, posicion = game.at(10,6)),
        new Enemigo(direccionActual = derecha, posicion = game.at(6,1))
    ],
    comidas = [
        new Hamburguesa(posicion = game.at(4,3)),
        new Hamburguesa(posicion = game.at(5,6)),
        new Manzana(posicion = game.at(9,7)),
        new Pescado(posicion = game.at(10,6)),
        new Helado(posicion = game.at(11,6))
    ],
    casilleroInicial = new CasilleroInicial(posicion = game.at(1, 9)),
    casilleroFinal = new CasilleroFinal(posicion = game.at(16,9)),
    proximoNivel = nivel3
)
