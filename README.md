# Carpincho al Ataque!

## Equipo de desarrollo

- Ardanaz, Ignacio
- Marmo, Lucas 
- Hartwig, Federico 
- Lovallo, Alejo
- D'Alessio Poisson, Julia
- Chittaro, Paula

## Capturas

(agregar)

## Reglas de Juego / Instrucciones

> Bienvenides, el juego consiste en desplazar a nuestro protagonista carpincho por el laberinto, e ir esquivando a los enemigos... SI LO TOCAN SE MUERE EL CARPINCHO 😱😱😱 Además, el carpincho NO SABE NADAR !!! Ergo, si se sumerge en el agua, también morirá 😪😒

## Respuestas teóricas

- **Polimorfismo**:  
   - *¿Cuál es el mensaje polimórfico? ¿Qué objetos lo implementan?  ¿Qué objeto se aprovecha de ello?*  
    
| Mensaje polimorórfico | Objetos que lo implementan | Objeto que se aprovecha |
| --- | ----------- | --- |
| proximaPosicion(pos) | izquierda - derecha - abajo - arriba | clase Personaje |
| direccionOpuesta() | izquierda - derecha - abajo - arriba | clase Enemigo |
| crear() | creadorDePared - creadorDeAgua | constructorDeBloques |
| rango(ini, fin) | orientacionVertical - orientacionHorizontal | constructorDeBloques |
| coordenada(ini, n) | orientacionVertical - orientacionHorizontal | constructorDeBloques |
| esDeLaMismaClase(obj) | clase Pared - clase Agua | clase Nivel |
| render() | conjuntoDeParedes - conjuntoDeAguas - clase Pared - clase Agua | clase Nivel |
| esLetal() | clase Personaje - clase Casillero | config |

- **Colecciones**:
   - *¿Qué operaciones de colecciones se utilizan? ¿Usaron mensajes con y sin efecto? ¿Para qué?*
   Utilizamos en numerosas ocasiones `forEach()`, una operacion con efecto, 
   También el `any()`, un sin efecto. 

- **Clases**:
   - *¿Usan clases? ¿Por qué? ¿Dónde o cuándo se instancian los objetos?*  
    Utilizamos clases en varias ocasiones ya que necesitabamos utilizar varios objetos que debían tener un mismo comportamiento/atributos. Por ejemplo, tenemos la clase Pared,
    que se instancia en el diseño de níveles.
    También tenemos clase abstractas como Casillero o Personaje, que en ningun momento se instancian.

- **Herencia**:
   - *¿Entre quiénes y por qué? ¿Qué comportamiento es común y cuál distinto?*  
    Utilizamos un hilo de herencia para describir tanto a los Casilleros como a los Personajes. Dentro de los primeros encontramos subClases como lo son Agua, Pared y Camino, y dentro de Personajes tenemos Protagonista y Enemigo.

- **Composición**:
   - *¿Qué objetos interactúan?*  

   - *¿Dónde se delega?*  


   - *¿Por qué no herencia?*  


