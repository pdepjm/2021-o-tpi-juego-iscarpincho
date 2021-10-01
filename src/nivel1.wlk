import wollok.game.*
import tablero.*
import nivel.*

const nivel1 = new Nivel(
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
    ]
)
    // casilleroInicial = new Tile(posicion = game.at(14, 4)),
    // casilleroFinal = new GoalTile(posicion = game.at(2,4))
