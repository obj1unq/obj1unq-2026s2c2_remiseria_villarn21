import viaje.*
import vehiculos.*
class Sucursal {
  const property vehiculos = #{}
  const property historial = []
  method agregarVehiculo(vehiculo){vehiculos.add(vehiculo)}
  method quitarVehiculo(vehiculo){vehiculos.remove(vehiculo)}
  method vehiculoQuePuedeCumplir(reserva){
    return vehiculos.filter({vehiculo => reserva.validarViaje(vehiculo)})
  }
  method registrarViaje(reserva, vehiculo){
    self.validarVehiculo(vehiculo)
    self.validarViaje(reserva, vehiculo)
    historial.add(new Viaje(reserva = reserva, vehiculo = vehiculo))
  }
  method validarVehiculo(vehiculo){
    if(not vehiculos.contains(vehiculo)){
        self.error("Este vehiculo no pertenece a la sucursal")
    }
  }
  method validarViaje(reserva, vehiculo){
    if(not reserva.validarViaje(vehiculo)){
        self.error(",,,")
    }
  }
  method historialDeVehiculo(vehiculo){
    return historial.filter({viaje=> viaje.vehiculo() == vehiculo})
  }
  method reservasDeVehiculo(vehiculo){
    return self.historialDeVehiculo(vehiculo).map({viaje=> viaje.reserva()})
  }
  method distanciaRecorridaPor(vehiculo){
    return self.historialDeVehiculo(vehiculo).sum({viaje=> viaje.distancia()})
  }
}
class Viaje{
  const property reserva 
  const property vehiculo
  method distancia()= reserva.distancia() 
}