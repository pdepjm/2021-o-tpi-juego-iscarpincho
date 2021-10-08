import wollok.game.*
import tablero.*
import nivel.*
import nivel2.*

const nivel1 = new Nivel(
    casilleros = [
        new ConjuntoDeParedes( // Pared inferior
            inicio = game.at(0,0),
            fin = game.at(17,0),
            orientacion = "x"
        ),
        new ConjuntoDeParedes( // Pared izquierda
            inicio = game.at(0,1),
            fin = game.at(0,10),
            orientacion = "y"
        ),
        new ConjuntoDeParedes( // Pared superior
            inicio = game.at(0, 10),
            fin = game.at(17, 10),
            orientacion = "x"
        ),
        new ConjuntoDeParedes( // Pared derecha
            inicio = game.at(17,1),
            fin = game.at(17, 10),
            orientacion = "y"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(2,1),
            fin = game.at(2, 6),
            orientacion = "y"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(1,8),
            fin = game.at(2, 8),
            orientacion = "x"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(3,1),
            fin = game.at(3, 3),
            orientacion = "y"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(4,8),
            fin = game.at(8, 8),
            orientacion = "x"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(10,8),
            fin = game.at(15, 8),
            orientacion = "x"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(10,9),
            fin = game.at(15, 9),
            orientacion = "x"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(10,7),
            fin = game.at(15, 7),
            orientacion = "x"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(6,6),
            fin = game.at(9, 6),
            orientacion = "x"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(5,5),
            fin = game.at(9, 5),
            orientacion = "x"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(6,4),
            fin = game.at(11, 4),
            orientacion = "x"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(7,3),
            fin = game.at(11, 3),
            orientacion = "x"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(8,10),
            fin = game.at(14, 10),
            orientacion = "x"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(14,5),
            fin = game.at(16, 5),
            orientacion = "x"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(14,4),
            fin = game.at(16, 4),
            orientacion = "x"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(8,2),
            fin = game.at(14,2),
            orientacion = "x"
        ),
        new ConjuntoDeParedes(
            inicio = game.at(4,1),
            fin = game.at(4, 2),
            orientacion = "y"
        ),
        new Pared(posicion = game.at(3, 6)),
        new Pared(posicion = game.at(5, 1)),
        new Pared(posicion = game.at(4, 7))
    ],
    casilleroInicial = new CasilleroInicial(posicion = game.at(1, 1)),
    casilleroFinal = new CasilleroFinal(posicion = game.at(16,9)),
    proximoNivel = nivel2
)
