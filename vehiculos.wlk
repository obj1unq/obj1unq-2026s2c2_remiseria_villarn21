import remiseria.*
import viaje.*


class Torino{
    var property motorRuidoso = true
    var property color = "Rojo"
    var property velocidadMaxima = 100
    var property autonomia = 100  
    method sillaDeRuedas() = false
    method capacidad() = 4 
}

class Economico{
    const property adaptaciones = #{}
    var capacidad = 5
    var velocidadMaxima = 120 
    var property motorRuidoso = true
    method color() ="Beige"
    var property autonomia = 200
    method funcionamiento() = "Gas"
    method velocidadMaxima()= velocidadMaxima
    method capacidad() = capacidad 
    method adaptaciones(adaptacion){
        adaptaciones.add(adaptacion)
    }
    method puedeLlevarSillaDeRuedas(){
        return adaptaciones.any({adaptacion=> adaptacion == transportador})
    }
    method adaptar(){
        capacidad = capacidad - self.capacidadAdaptaciones()
        motorRuidoso = not(self.motorRuidosoAdaptaciones())
        velocidadMaxima = self.velocidadAdaptaciones()
        autonomia = autonomia + self.autonomiaAdaptaciones()
    }
    method capacidadAdaptaciones(){
      return adaptaciones.sum({adaptacion=> adaptacion.capacidad()})
    }
    method motorRuidosoAdaptaciones(){
        return adaptaciones.any({adaptacion=> adaptacion.ruidoso() == false})
    }
    method velocidadAdaptaciones(){
        return adaptaciones.map({adaptacion=> adaptacion.velocidad()}).min()
    }
    method autonomiaAdaptaciones(){
        return adaptaciones.sum({adaptacion=> adaptacion.autonomia()})
    }
}

object transportador {
  method velocidad() = 90
  method capacidad() = 1
  method ruidoso() = true
  method autonomia() = -20
}
object cañoDeEscape {
  method velocidad() = 115
  method capacidad() = 0
  method ruidoso() = false
  method autonomia() = -10
}
object tanqueExtra {
  method velocidad() = 80
  method capacidad() = 1
  method ruidoso() = false
  method autonomia() = 200
}
 object combi {
  var property color = "Celeste"
  method capacidad() = modo.capacidad()
  var property motor = urbano
  var property modo = espacioso
  method motorRuidoso() = motor.esRuidoso()
  method puedeLlevarSillaDeRuedas() = modo.sillaDeRuedas()
  method velocidadMaxima() = motor.velocidad()
  method autonomia() = motor.autonomia()
}
object espacioso{
    method capacidad() = 7
    method sillaDeRuedas() = false
}
object accesible{
    method capacidad() = 5
    method sillaDeRuedas() = true
}

object deportivo{
    method autonomia() = 400
    method velocidad() = 230
    method esRuidoso() = true
}
object urbano{
    method autonomia() = 1000
    method velocidad() = 130
    method esRuidoso() = false
}

/*

1)¿Da igual que las colecciones de flotas y viajes en la sucursal sean listas o conjuntos? Si piensas que no, cambia una implementación por la otra y revisa el resultado.

2)¿Dónde se instancia un viaje, dentro o fuera de la clase Sucursal?. Pensar como sería la alternativa.

3)¿La combi es un objeto autodefinido o una instancia de clase? ¿Se puede usar la otra variante indistintamente?

*/
/*
1)No, no da igual ya que en el caso de "flotas"(vehiculos) no tendria sentido que hayan elementos repetidos por ende debe ser una coleccion. En cambio en "viajes"(historial) es importante el orden ya que es el registro de todos los viajes. 

2)Un viaje se intancia dentro de Sucursal, ya que Sucursal es quien guarda el historial de las mismas.

3)La combi es un objeto autodefinido ya que el enunciado aclara que es un vehiculo unico. 
*/