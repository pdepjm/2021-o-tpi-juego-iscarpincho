# Carpincho al Ataque!

## Equipo de desarrollo

- Ardanaz, Ignacio
- Marmo, Lucas 
- Hartwig, Federico 
- Lovallo, Alejo
- D'Alessio Poisson, Julia
- Chittaro, Paula

## Capturas  

![Nivel3](/assets/cap3.png)
## Reglas de Juego / Instrucciones
> El juego "Carpincho al ataque" consiste en ir desplazando a nuestro protagonista carpincho por el mapa hasta llegar a la posición final. En el camino tendrá que esquivar obstáculos, algunos mortales y otros que simplemente no lo dejarán pasar. Además, deberá tener cuidado de no chocarse con algún enemigo ya que podria morirse!!!. En su recorrido tendrá la posibilidad de ir recolectando diferentes comestibles, los cuales producen distintos efectos sobre él. El objetivo es llegar al final del juego sin que sus vidas ❤ se acaben.

> A disfrutar! 🍾🍾🍾

### **Protagonista**:
* ![carpincho](/assets/personaje_derecha.png) `El protagonista:` nuestro amigo carpincho 🤙🏼😎🤙🏼

### **Obstáculos**:  
* ![camino](/assets/camino.png) `Los caminos 🟩` son por donde nuestro personaje(y los enemigos) pueden transitar.
* ![pared](/assets/pared.png) `La pared 🕋` es un obstáculo que no permite pasar tanto al personaje como a los enemigos. 
* ![agua](/assets/agua.png) `El agua 💧` permite ser transitada por el personaje, pero cuando la pisa, pierde una vida y vuelve al principio del nivel. Los enemigos no pueden pisarla.
* ![fuego](/assets/fuego.gif)  `El fuego 🔥` le quita todas las vidas a nuestro personaje, hay que tener cuidado!! 😱⚰️😱 (PD: Tampoco puede ser pisado por los enemigos.)

### **Enemigo**:  
* ![enemigo](/assets/enemigo_derecha.png) `Los enemigos 🚗` se desplazan en una sola dirección: vertical u horizontal. Siguen su trayectoria hasta chocar con algo, cuando se dan vuelta y vuelven para atrás. Al tocar al personaje, le quitan una vida y lo hacen volver a comenzar el nivel. 

### **Comestibles**:  
* ![manzana](/assets/manzana.png) `Una manzana 🍎` hace que el carpincho gane una vida! 
* ![hamburguesa](/assets/hamburguesa.png) `Una hambuerguesa 🍔` hace que el carpincho pierda una vida!  
* ![pescado](/assets/pescado.png) `Un pescado 🐟` hace que el carpincho recupere todas sus vidas (son 3)! 
* ![helado](/assets/helado.png) `Un helado 🍦` hace que el carpincho quede inmovilizado por 2,5 segundos!
## Respuestas teóricas

- **Polimorfismo**:
   - *¿Cuál es el mensaje polimórfico? ¿Qué objetos lo implementan?  ¿Qué objeto se aprovecha de ello?*  
    
| Mensaje polimorórfico | Objetos que lo implementan | Objeto que se aprovecha |
| --- | ----------- | --- |
| proximaPosicion(pos) | izquierda - derecha - abajo - arriba | clase Personaje |
| direccionOpuesta() | izquierda - derecha - abajo - arriba | clase Enemigo |
| rango(ini, fin) | orientacionVertical - orientacionHorizontal | clase ConjuntoDeCasilleros |
| coordenada(ini, n) | orientacionVertical - orientacionHorizontal | clase ConjuntoDeCasilleros |
| render() | conjuntoDeCasilleros - clase Casillero | clase Nivel |
| esLetal() | clase Personaje - clase Casillero - clase Comida | config |
| esFullLetal() | clase Personaje - clase Casillero - clase Comida | config |
| producirEfecto() | clase Manzana - clase Pecado - clase Helado - clase Hamburguesa | config |

- **Colecciones**:
   - *¿Qué operaciones de colecciones se utilizan? ¿Usaron mensajes con y sin efecto?*
     
| Operación | Con efecto | Sin efecto |
| --- | ----------- | --- |
| add() | X |   |
| all() |   | X |
| any() |   | X |
| forEach() | X |   |
| isEmpty() |   | X |  

- **Clases**:
   - *¿Usan clases? ¿Por qué? ¿Dónde o cuándo se instancian los objetos?*  
    Utilizamos clases en varias ocasiones ya que necesitabamos utilizar varios objetos que debían tener un mismo comportamiento/atributos. Por ejemplo, tenemos la clase Pared,
    que se instancia en el diseño de níveles.
    También tenemos clase abstractas como Casillero o Personaje, que en ningun momento se instancian.

- **Herencia**:
   - *¿Entre quiénes y por qué? ¿Qué comportamiento es común y cuál distinto?*  
    Utilizamos un hilo de herencia para describir tanto a los Casilleros como a los Personajes y las Comidas. Dentro de los primeros encontramos subClases como lo son Agua, Pared y Camino. Dentro de Personajes tenemos Protagonista y Enemigo. Y dentro de Comidas tenemos Manzana, Pescado, Helado y Hamburguesa.

- **Composición**:
   - *¿Qué objetos interactúan?*  
   La clase ConjuntoDeCasilleros interactua con orientacionVertical y orientacionHorizontal.
   - *¿Dónde se delega?*  
   Se delega en la variable orientacion.
   - *¿Por qué no herencia?* 
   Ya que la orientación va a ir cambiando en cada instancia de la clase ConjuntoDeCasilleros. Además, como diría un tal Alfredo Sanzo:
      > "La herencia es un arma de un solo tiro" ∼ Alf (28/10/2021 11:33 AM).

      Por lo tanto, si quisieramos por ejemplo crear una subclase conjunto de casilleros horizontal y otra vertical, esto confrontaría con las clases ya heredadas de conjunto de paredes, de aguas y de fuegos.
      
## Diagramas de clases
* ![diagrama](/assets/TPCarpincho.png) 