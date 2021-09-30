import wollok.game.*
import tablero.*
import nivel.*

const nivel1 = new Nivel(
    paredes = [
        //Pared izquierda
        new Pared(position = game.at(0, 0)),
        new Pared(position = game.at(0, 1)),
        new Pared(position = game.at(0, 2)),
        new Pared(position = game.at(0, 3)),
        new Pared(position = game.at(0, 4)),
        new Pared(position = game.at(0, 5)),
        new Pared(position = game.at(0, 6)),
        new Pared(position = game.at(0, 7)),
        new Pared(position = game.at(0, 8)),
        new Pared(position = game.at(0, 9)),
        new Pared(position = game.at(0, 10)),

        //Pared derecha
        new Pared(position = game.at(14, 0)),
        new Pared(position = game.at(14, 1)),
        new Pared(position = game.at(14, 2)),
        new Pared(position = game.at(14, 3)),
        new Pared(position = game.at(14, 4)),
        new Pared(position = game.at(14, 5)),
        new Pared(position = game.at(14, 6)),
        new Pared(position = game.at(14, 7)),
        new Pared(position = game.at(14, 8)),
        new Pared(position = game.at(14, 9)),
        new Pared(position = game.at(14, 10)),
        
        //Pared inferior
        new Pared(position = game.at(1, 0)),
        new Pared(position = game.at(2, 0)),
        new Pared(position = game.at(3, 0)),
        new Pared(position = game.at(4, 0)),
        new Pared(position = game.at(5, 0)),
        new Pared(position = game.at(6, 0)),
        new Pared(position = game.at(7, 0)),
        new Pared(position = game.at(8, 0)),
        new Pared(position = game.at(9, 0)),
        new Pared(position = game.at(10, 0)),
        new Pared(position = game.at(11, 0)),
        new Pared(position = game.at(12, 0)),
        new Pared(position = game.at(13, 0)),
        new Pared(position = game.at(14, 0)),

        //pared superior
        new Pared(position = game.at(1, 10)),
        new Pared(position = game.at(2, 10)),
        new Pared(position = game.at(3, 10)),
        new Pared(position = game.at(4, 10)),
        new Pared(position = game.at(5, 10)),
        new Pared(position = game.at(6, 10)),
        new Pared(position = game.at(7, 10)),
        new Pared(position = game.at(8, 10)),
        new Pared(position = game.at(9, 10)),
        new Pared(position = game.at(10, 10)),
        new Pared(position = game.at(11, 10)),
        new Pared(position = game.at(12, 10)),
        new Pared(position = game.at(13, 10))
    ],
    caminos = [
        new Camino(position = game.at(2, 1)),
        new Camino(position = game.at(2, 2)),
        new Camino(position = game.at(2, 3)),
        new Camino(position = game.at(2, 4)),
        new Camino(position = game.at(2, 5)),
        new Camino(position = game.at(2, 6)),
        new Camino(position = game.at(2, 7)),
        new Camino(position = game.at(2, 8)),
        new Camino(position = game.at(2, 9))
    ]
    // casilleroInicial = new Tile(position = game.at(14, 4)),
    // casilleroFinal = new GoalTile(position = game.at(2,4))
)