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
}
