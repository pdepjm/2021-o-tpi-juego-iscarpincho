import wollok.game.*
import tablero.*
import nivel.*

const nivel2 = new Nivel(
    paredes = [
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
            inicio = game.at(2,8),
            fin = game.at(2, 9),
            orientacion = "y"
        ),
        new Pared(posicion = game.at(15, 4))
    ],
    aguas = [
        new Agua(posicion = game.at(15, 3))
    ],
    casilleroInicial = new CasilleroInicial(posicion = game.at(1, 9)),
    casilleroFinal = new CasilleroFinal(posicion = game.at(16,1)),
    proximoNivel = nivel2
)
