/** First Wollok example */
import wollok.game.*

object lionel {
	var property position = game.at(3,5)

	var property image = "lionel-titular.png"
	var property camisetaActual = titular

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
		if (not self.laPelotaEstaEnLionel()) self.error("La pelota no esta en Lionel")
	}

	
	method cambiarCamiseta(){
		self.validarCambiarCamiseta()
		camisetaActual.cambiar(self)
	}

	method validarCambiarCamiseta(){
		if(not (position == game.at(0,5))){
			self.error("leo no se puede cambiar la camiseta en esta posicion")
		}
	}
}

object titular{
	var property camiseta = "lionel-titular.png"

	method cambiar(personaje){
		personaje.image(suplente.camiseta())
		personaje.camisetaActual(suplente)
	}
}
object suplente{
	var property camiseta = "lionel-suplente.png"

	method cambiar(personaje){
		personaje.image(titular.camiseta())
		personaje.camisetaActual(titular)
	}
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method levantarla(){
		if(position == lionel.position()){  //LEVANTA LA PELOTA Y CAE LUEGO DE 2 SEGUNDOS 
			
			self.levantar()

			game.schedule(2000, {self.caer()}) 
		}
	}

	method levantar(){ 
		position = position.up(1)
	}

	method caer(){ 
		position = position.down(1)
	}
	
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
