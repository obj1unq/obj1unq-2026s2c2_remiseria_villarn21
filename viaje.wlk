import vehiculos.*
import remiseria.*
class Reserva{
  var property capacidad = 4
  var property distancia = 100
  var property tiempoDeViaje = 1
  const coloresIndicados = #{}
  var property necesidadDeSillaDeRuedas = false
  var property necesidadDeMotorSilencioso = false
  method velocidadRequerida() = distancia / tiempoDeViaje + 10
  method coloresIndicados(color){
    coloresIndicados.add(color)
  }
  method validarViaje(vehiculo){
    return (
        self.validarCapacidad(vehiculo)&&
        self.validarDistancia(vehiculo)&&
        self.validarVelocidad(vehiculo)&&
        self.esVehiculoRespetuoso(vehiculo))
  }
  method validarCapacidad(vehiculo){
    return vehiculo.capacidad() >= capacidad
  }
  method validarDistancia(vehiculo){
    return vehiculo.autonomia() >= distancia
  }
  method validarVelocidad(vehiculo){
    return vehiculo.velocidadMaxima() >= self.velocidadRequerida()
  }
    method esVehiculoRespetuoso(vehiculo){
        return (
            self.validarColor(vehiculo)&&
            self.validarSillaDeRuedas(vehiculo)&&
            self.validarMotor(vehiculo)
        )
        }
    method validarColor(vehiculo){
    return not(coloresIndicados.any({color=> color == vehiculo.color()}))
    }
    method validarSillaDeRuedas(vehiculo){
        return not necesidadDeSillaDeRuedas or vehiculo.puedeLlevarSillaDeRuedas()
    }
    method validarMotor(vehiculo){
        return not necesidadDeMotorSilencioso or not vehiculo.motorRuidoso()
    }
}