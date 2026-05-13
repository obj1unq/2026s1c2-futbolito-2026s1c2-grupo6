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
}
