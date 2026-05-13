/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method taquito() {
	  self.confirmarSiEstaLaPelotaEnLionel()
	  pelota.moverConBotin()
	}

	method laPelotaEstaEnLionel() {
	  return pelota.position() == self.position()
	}

	method confirmarSiEstaLaPelotaEnLionel() {
	  if (not self.laPelotaEstaEnLionel())
	  	self.error("La pelota no esta en Lionel")
	}

}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)
	
	method moverConBotin() {
	  position = game.at(0.max(position.x() - 2), position.y()) 
	}

	var property jugador = lionel

	method subir() {
		self.noLlegoAlaPelota()
	  	position = position.up(1)
	 	game.schedule(2000, {self.bajar()})
	}

	method bajar() {
	  position = position.down(1)
	}


	method noLlegoAlaPelota() {
	  if(not self.estaConLaPelota()){
			self.error("Liones no esta en posicion con la pelota")
	  }
	}

	method estaConLaPelota() {
	  return self.position() == jugador.position()
	}



	method patear(){
		 self.validarPosicion()
		 position =  game.at((game.width() - 1).min(position.x() + 3), position.y()) 
		
	}
     method validarPosicion(){
		 if (!(jugador.position().x() == position.x())){
			 self.error("el jugadór No está lo suficientemente cerca para patear la pelota")
			
		 }
	 }	
}
